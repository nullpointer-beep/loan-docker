webpackJsonp([20,33],{"2OCm":function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r={data:function(){return{visible:!1,menuList:[],orgList:this.treeDataTranslate(JSON.parse(sessionStorage.getItem("orgList")||"[]"),"orgNo","parentNo"),menuListTreeProps:{label:"name",children:"children"},orgListTreeProps:{label:"orgName",children:"children"},dataForm:{id:0,roleName:"",remark:""},dataRule:{roleName:[{required:!0,message:"角色名称不能为空",trigger:"blur"}]}}},methods:{init:function(e){var t=this;this.dataForm.id=e||0,this.$http({url:"/sys/menu/list",method:"get"}).then(function(e){var a=e.data;t.menuList=t.treeDataTranslate(a.menuList,"menuId")}).then(function(){t.visible=!0,t.$nextTick(function(){t.$refs.dataForm.resetFields(),t.$refs.menuListTree.setCheckedKeys([])})}).then(function(){t.dataForm.id&&t.$http({url:"/sys/role/info/"+t.dataForm.id,method:"get"}).then(function(e){var a=e.data;a&&0===a.code&&(t.dataForm.roleName=a.role.roleName,t.dataForm.remark=a.role.remark,t.$refs.menuListTree.setCheckedKeys(a.role.menuIdList),t.$refs.orgListTree.setCheckedKeys(a.role.orgNoList))})})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:"/sys/role/"+(e.dataForm.id?"update":"save"),method:"post",data:{roleId:e.dataForm.id||void 0,roleName:e.dataForm.roleName,remark:e.dataForm.remark,menuIdList:[].concat(e.$refs.menuListTree.getCheckedKeys(),e.$refs.menuListTree.getHalfCheckedKeys()),orgNoList:[].concat(e.$refs.orgListTree.getCheckedKeys(),e.$refs.orgListTree.getHalfCheckedKeys())}}).then(function(t){var a=t.data;a&&0===a.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.visible=!1,e.$emit("refreshDataList"))})})}}},n={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"80px"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"角色名称",prop:"roleName"}},[a("el-input",{attrs:{placeholder:"角色名称"},model:{value:e.dataForm.roleName,callback:function(t){e.$set(e.dataForm,"roleName",t)},expression:"dataForm.roleName"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"备注",prop:"remark"}},[a("el-input",{attrs:{type:"textarea",placeholder:"备注"},model:{value:e.dataForm.remark,callback:function(t){e.$set(e.dataForm,"remark",t)},expression:"dataForm.remark"}})],1),e._v(" "),a("el-form-item",{attrs:{size:"mini",label:"功能权限"}},[a("el-tree",{ref:"menuListTree",attrs:{"check-strictly":"",data:e.menuList,props:e.menuListTreeProps,"node-key":"menuId","default-expand-all":!0,"show-checkbox":""}})],1),e._v(" "),a("el-form-item",{attrs:{size:"mini",label:"数据权限"}},[a("el-tree",{ref:"orgListTree",attrs:{"check-strictly":"",data:e.orgList,props:e.orgListTreeProps,"node-key":"orgNo","default-expand-all":!0,"show-checkbox":""}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")(r,n,!1,null,null,null);t.default=i.exports},rE8r:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r={data:function(){return{searchForm:{roleName:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListSelections:[],addOrUpdateVisible:!1}},components:{AddOrUpdate:a("2OCm").default},activated:function(){this.getDataList()},methods:{getDataList:function(){var e=this;this.$http({url:"/sys/role/list",method:"get",params:{page:this.pageIndex,limit:this.pageSize,roleName:this.searchForm.roleName}}).then(function(t){var a=t.data;a&&0===a.code?(e.dataList=a.page.records,e.totalPage=a.page.total):(e.dataList=[],e.totalPage=0)})},sizeChangeHandle:function(e){this.pageSize=e,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(e){this.pageIndex=e,this.getDataList()},selectionChangeHandle:function(e){this.dataListSelections=e},addOrUpdateHandle:function(e){var t=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){t.$refs.addOrUpdate.init(e)})},deleteHandle:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.roleId});this.$confirm("确定对[id="+a.join(",")+"]进行["+(e?"删除":"批量删除")+"]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){t.$http({url:"/sys/role/delete",method:"post",data:a}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.getDataList())})}).catch(function(){})}}},n={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"mod-role"},[a("el-form",{attrs:{inline:!0,model:e.searchForm},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"角色名称",clearable:""},model:{value:e.searchForm.roleName,callback:function(t){e.$set(e.searchForm,"roleName",t)},expression:"searchForm.roleName"}})],1),e._v(" "),a("el-form-item",[a("el-button",{on:{click:function(t){return e.getDataList()}}},[e._v("查询")]),e._v(" "),e.isAuth("sys:role:save")?a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.addOrUpdateHandle()}}},[e._v("新增")]):e._e(),e._v(" "),e.isAuth("sys:role:delete")?a("el-button",{attrs:{type:"danger",disabled:e.dataListSelections.length<=0},on:{click:function(t){return e.deleteHandle()}}},[e._v("批量删除\n      ")]):e._e()],1)],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""},on:{"selection-change":e.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),e._v(" "),a("el-table-column",{attrs:{prop:"roleName","header-align":"center",align:"center",label:"角色名称"}}),e._v(" "),a("el-table-column",{attrs:{"show-overflow-tooltip":"",prop:"remark","header-align":"center",align:"center",label:"备注"}}),e._v(" "),a("el-table-column",{attrs:{prop:"createTime","header-align":"center",align:"center",width:"180",label:"创建时间"}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.isAuth("sys:role:update")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.addOrUpdateHandle(t.row.roleId)}}},[e._v("修改\n        ")]):e._e(),e._v(" "),e.isAuth("sys:role:delete")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.deleteHandle(t.row.roleId)}}},[e._v("\n          删除\n        ")]):e._e()]}}])})],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.pageIndex,"page-sizes":[10,20,50,100],"page-size":e.pageSize,total:e.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.sizeChangeHandle,"current-change":e.currentChangeHandle}}),e._v(" "),e.addOrUpdateVisible?a("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:e.getDataList}}):e._e()],1)},staticRenderFns:[]},i=a("VU/8")(r,n,!1,null,null,null);t.default=i.exports}});