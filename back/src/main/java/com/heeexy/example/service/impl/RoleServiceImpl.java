package com.heeexy.example.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.RoleDao;
import com.heeexy.example.service.RoleService;
import com.heeexy.example.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *  * @Description: 角色/权限
 *  * @author chengwengao
 *  * @date 2018/9/20 0020 2:37
 *  
 */
@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleDao roleDao;

    @Override
    public JSONObject addRole(JSONObject jsonObject) {
        roleDao.insertRole(jsonObject);
        return CommonUtil.successJson();
    }

    /**
     * 修改角色
     *
     * @param jsonObject
     * @return
     */
    @Override
    public JSONObject updateRole(JSONObject jsonObject) {
        roleDao.updateRole(jsonObject);
        return CommonUtil.successJson();
    }

    /**
     * 删除角色
     *
     * @param jsonObject
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public JSONObject deleteRole(JSONObject jsonObject) {
        roleDao.removeRole(jsonObject);
        return CommonUtil.successJson();
    }
}
