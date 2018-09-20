package com.heeexy.example.dao;

import com.alibaba.fastjson.JSONObject;

/**
 *  * @Description: 角色/权限
 *  * @author chengwengao
 *  * @date 2018/9/20 0020 2:24
 *  
 */
public interface RoleDao {

    /**
     * 新增角色
     *
     * @param jsonObject
     * @return
     */
    int insertRole(JSONObject jsonObject);

    /**
     * 修改角色
     *
     * @param jsonObject
     * @return
     */
    int updateRole(JSONObject jsonObject);

    /**
     * 删除角色
     *
     * @param jsonObject
     * @return
     */
    int removeRole(JSONObject jsonObject);

}
