package com.heeexy.example.service;

import com.alibaba.fastjson.JSONObject;

/**
 *  * @Description: 角色/权限
 *  * @author chengwengao
 *  * @date 2018/9/20 0020 2:37
 *  
 */
public interface RoleService {
    /**
     * 新增角色
     *
     * @param jsonObject
     * @return
     */
    JSONObject addRole(JSONObject jsonObject);

    /**
     * 修改角色
     *
     * @param jsonObject
     * @return
     */
    JSONObject updateRole(JSONObject jsonObject);

    /**
     * 删除角色
     *
     * @param jsonObject
     * @return
     */
    JSONObject deleteRole(JSONObject jsonObject);
}
