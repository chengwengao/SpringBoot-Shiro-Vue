<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form>
        <el-form-item>
          <el-button type="primary" icon="plus" v-if="hasPerm('role:add')" @click="showCreate">添加
          </el-button>
        </el-form-item>
      </el-form>
    </div>
    <el-table :data="list" v-loading.body="listLoading" element-loading-text="拼命加载中" border fit
              highlight-current-row>
      <el-table-column align="center" label="序号" width="80">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"> </span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="角色名称" prop="roleName" style="width: 60px;"></el-table-column>
      
      <el-table-column align="center" label="创建时间" prop="createTime" width="170"></el-table-column>
      <el-table-column align="center" label="最近修改时间" prop="updateTime" width="170"></el-table-column>
      <el-table-column align="center" label="状态" prop="status" width="100">
        <template slot-scope="scope">
          <el-tag type="success" v-if="scope.row.status===1">启用</el-tag>
          <el-tag type="info" v-else>停用</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" label="管理" width="220" v-if="hasPerm('role:update')">
        <template slot-scope="scope">
          <el-button type="primary" icon="edit" @click="showUpdate(scope.$index)">修改</el-button>
          <el-button type="danger" icon="delete" v-if="scope.row.roleId!=roleId "
                     @click="removeRole(scope.$index)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="listQuery.pageNum"
      :page-size="listQuery.pageRow"
      :total="totalCount"
      :page-sizes="[10, 20, 50, 100]"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form class="small-space" :model="tempRole" label-position="left" label-width="80px"
               style='width: 300px; margin-left:50px;'>
        <el-form-item label="角色名称" required>
          <el-input type="text" v-model="tempRole.roleName">
          </el-input>
        </el-form-item>
        <el-form-item label="状态" required >
          <el-select v-model="tempRole.status" placeholder="请选择">
            <el-option
              v-for="item in statusList"
              :key="item.code"
              :label="item.name"
              :value="item.code">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button v-if="dialogStatus=='create'" type="success" @click="createRole">创 建</el-button>
        <el-button type="primary" v-else @click="updateRole">修 改</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import {mapGetters} from 'vuex'
  import { formatDate } from '../../utils/DateUtil'

  export default {
    data() {
      return {
        totalCount: 0, //分页组件--数据总条数
        list: [],//表格的数据
        listLoading: false,//数据加载等待动画
        listQuery: {
          pageNum: 1,//页码
          pageRow: 50,//每页条数
        },
        roles: [],//角色列表
        dialogStatus: 'create',
        dialogFormVisible: false,
        textMap: {
          update: '编辑',
          create: '新建角色'
        },
        tempRole: {
          roleName: '',
          createTime: '',
          updateTime: '',
          status: '',
          delFlag: '',
          roleId: ''
        },
        //角色状态，TODO:整合字典表
        statusList:[
            {
                code: 1,
                name:'启用'
            },
            {
                code: 0,
                name:'停用'
            }
        ]
      }
    },
    created() {
      this.getList();
      if (this.hasPerm('role:add') || this.hasPerm('role:update')) {
        this.getAllRoles();
      }
    },
    computed: {
      ...mapGetters([
        'roleId'
      ])
    },
    methods: {
      getAllRoles() {
        this.api({
          url: "/user/getAllRoles",
          method: "get"
        }).then(data => {
          this.roles = data.list;
        })
      },
      getList() {
        //查询列表
        this.listLoading = true;
        this.api({
          url: "/user/listRole",
          method: "get",
          params: this.listQuery
        }).then(data => {
          this.listLoading = false;
          this.list = data.list;
          this.totalCount = data.totalCount;
        })
      },
      handleSizeChange(val) {
        //改变每页数量
        this.listQuery.pageRow = val
        this.handleFilter();
      },
      handleCurrentChange(val) {
        //改变页码
        this.listQuery.pageNum = val
        this.getList();
      },
      handleFilter() {
        //查询事件
        this.listQuery.pageNum = 1
        this.getList()
      },
      getIndex($index) {
        //表格序号
        return (this.listQuery.pageNum - 1) * this.listQuery.pageRow + $index + 1
      },
      showCreate() {
        //显示新增对话框
        this.tempRole.roleName = "";
        this.tempRole.roleId = "";
        this.tempRole.status = "";
        this.tempRole.delFlag = "0";
        this.dialogStatus = "create"
        this.dialogFormVisible = true
      },
      showUpdate($index) {
        let role = this.list[$index];
        // this.tempRole = role;  //去除编辑弹框与列表数据的双向绑定
        this.tempRole.roleId = role.roleId;
        this.tempRole.roleName = role.roleName;
        this.tempRole.delFlag = role.delFlag;
        this.tempRole.status = role.status;
        this.dialogStatus = "update"
        this.dialogFormVisible = true
      },
      createRole() {
        //添加新角色
        this.api({
          url: "/role/addRole",
          method: "post",
          data: this.tempRole
        }).then(() => {
          this.getList();
          this.dialogFormVisible = false
        })
      },
      updateRole() {
        //修改角色信息
        let _vue = this;
        this.api({
          url: "/role/updateRole",
          method: "post",
          data: this.tempRole
        }).then(() => {
          let msg = "修改成功";
          this.dialogFormVisible = false
          if (this.roleId === this.tempRole.roleId) {
            msg = '修改成功,部分信息重新登录后生效'
          }
          this.$message({
            message: msg,
            type: 'success',
            duration: 1 * 1000,
            onClose: () => {
              _vue.getList();
            }
          })
        })
      },
      removeRole($index) {
        let _vue = this;
        this.$confirm('确定删除此角色?', '提示', {
          confirmButtonText: '确定',
          showCancelButton: false,
          type: 'warning'
        }).then(() => {
          let role = _vue.list[$index];
          role.delFlag = '1';
          _vue.api({
            url: "/role/deleteRole",
            method: "post",
            data: role
          }).then(() => {
            _vue.getList()
          }).catch(() => {
            _vue.$message.error("删除失败")
          })
        })
      },
    }
  }
</script>
