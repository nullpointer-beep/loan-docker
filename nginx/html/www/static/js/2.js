webpackJsonp([2,18],{"7+Dk":function(e,t,n){"use strict";var a=n("NGEn"),r=n.n(a),o={name:"table-tree-column",props:{prop:{type:String},treeKey:{type:String,default:"id"},parentKey:{type:String,default:"parentId"},levelKey:{type:String,default:"_level"},childKey:{type:String,default:"childrens"}},methods:{childStyles:function(e){return{"padding-left":(e[this.levelKey]>1?7*e[this.levelKey]:0)+"px"}},iconClasses:function(e){return[e._expanded?"el-icon-caret-bottom":"el-icon-caret-right"]},iconStyles:function(e){return{visibility:this.hasChild(e)?"visible":"hidden"}},hasChild:function(e){return r()(e[this.childKey])&&e[this.childKey].length>=1||!1},toggleHandle:function(e,t){var n=this;if(this.hasChild(t)){var a=this.$parent.store.states.data.slice(0);a[e]._expanded=!a[e]._expanded,a=a[e]._expanded?a.splice(0,e+1).concat(t[this.childKey]).concat(a):this.removeChildNode(a,t[this.treeKey]),this.$parent.store.commit("setData",a),this.$nextTick(function(){n.$parent.doLayout()})}},removeChildNode:function(e,t){var n=r()(t)?t:[t];if(t.length<=0)return e;for(var a=[],o=0;o<e.length;o++)-1!==n.indexOf(e[o][this.parentKey])&&-1===n.indexOf(e[o][this.treeKey])&&(a.push(e.splice(o,1)[0][this.treeKey]),o--);return this.removeChildNode(e,a)}}},i={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("el-table-column",e._b({attrs:{prop:e.prop},scopedSlots:e._u([{key:"default",fn:function(t){return[n("span",{style:e.childStyles(t.row),on:{click:function(n){return n.preventDefault(),e.toggleHandle(t.$index,t.row)}}},[n("i",{class:e.iconClasses(t.row),style:e.iconStyles(t.row)}),e._v("\n      "+e._s(t.row[e.prop])+"\n    ")])]}}])},"el-table-column",e.$attrs,!1))},staticRenderFns:[]},l=n("VU/8")(o,i,!1,null,null,null);t.a=l.exports},WcdF:function(e,t,n){(e.exports=n("FZ+f")(!1)).push([e.i,"\n.menu-list__input > .el-input__inner,\n.icon-list__input > .el-input__inner {\n  cursor: pointer;\n}\n.mod-menu__icon-popover {\n  max-width: 350px;\n}\n.mod-menu__icon-list {\n  max-height: 380px;\n  padding: 0;\n  margin: -8px 0 0 -8px;\n}\n.mod-menu__icon-list > .el-button {\n    padding: 8px;\n    margin: 8px 0 0 8px;\n}\n.mod-menu__icon-list > .el-button > span {\n      display: inline-block;\n      vertical-align: middle;\n      width: 18px;\n      height: 18px;\n      font-size: 18px;\n}\n.icon-list__tips {\n  font-size: 18px;\n  text-align: center;\n  color: #e6a23c;\n  cursor: pointer;\n}\n",""])},cFZF:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var a=n("Q7M0"),r={data:function(){var e=this;return{visible:!1,dataForm:{id:0,type:1,typeList:["目录","菜单","按钮"],name:"",parentId:0,parentName:"",url:"",perms:"",orderNum:0,icon:"",iconList:[]},dataRule:{name:[{required:!0,message:"菜单名称不能为空",trigger:"blur"}],parentName:[{required:!0,message:"上级菜单不能为空",trigger:"change"}],url:[{validator:function(t,n,a){1!==e.dataForm.type||/\S/.test(n)?a():a(new Error("菜单URL不能为空"))},trigger:"blur"}]},menuList:[],menuListTreeProps:{label:"name",children:"children"}}},created:function(){this.iconList=a.a.getNameList()},methods:{init:function(e){var t=this;this.dataForm.id=e||0,this.$http({url:"/sys/menu/select",method:"get"}).then(function(e){var n=e.data;t.menuList=t.treeDataTranslate(n.menuList,"menuId")}).then(function(){t.visible=!0,t.$nextTick(function(){t.$refs.dataForm.resetFields()})}).then(function(){t.dataForm.id?t.$http({url:"/sys/menu/info/"+t.dataForm.id,method:"get"}).then(function(e){var n=e.data;t.dataForm.id=n.menu.menuId,t.dataForm.type=n.menu.type,t.dataForm.name=n.menu.name,t.dataForm.parentId=n.menu.parentId,t.dataForm.url=n.menu.url,t.dataForm.perms=n.menu.perms,t.dataForm.orderNum=n.menu.orderNum,t.dataForm.icon=n.menu.icon,t.menuListTreeSetCurrentNode("mod")}):t.menuListTreeSetCurrentNode()})},menuListTreeCurrentChangeHandle:function(e,t){this.dataForm.parentId=e.menuId,this.dataForm.parentName=e.name},menuListTreeSetCurrentNode:function(e){"mod"===e&&(this.$refs.menuListTree.setCurrentKey(this.dataForm.parentId),this.dataForm.parentName=(this.$refs.menuListTree.getCurrentNode()||{}).name)},iconActiveHandle:function(e){this.dataForm.icon=e},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:"/sys/menu/"+(e.dataForm.id?"update":"save"),method:"post",data:{menuId:e.dataForm.id||void 0,type:e.dataForm.type,name:e.dataForm.name,parentId:e.dataForm.parentId,url:e.dataForm.url,perms:e.dataForm.perms,orderNum:e.dataForm.orderNum,icon:e.dataForm.icon}}).then(function(t){var n=t.data;n&&0===n.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.visible=!1,e.$emit("refreshDataList"))})})}}},o={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[n("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"80px"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.dataFormSubmit()}}},[n("el-form-item",{attrs:{label:"类型",prop:"type"}},[n("el-radio-group",{model:{value:e.dataForm.type,callback:function(t){e.$set(e.dataForm,"type",t)},expression:"dataForm.type"}},e._l(e.dataForm.typeList,function(t,a){return n("el-radio",{key:a,attrs:{label:a}},[e._v(e._s(t))])}),1)],1),e._v(" "),n("el-form-item",{attrs:{label:e.dataForm.typeList[e.dataForm.type]+"名称",prop:"name"}},[n("el-input",{attrs:{placeholder:e.dataForm.typeList[e.dataForm.type]+"名称"},model:{value:e.dataForm.name,callback:function(t){e.$set(e.dataForm,"name",t)},expression:"dataForm.name"}})],1),e._v(" "),n("el-form-item",{attrs:{label:"上级菜单",prop:"parentName"}},[n("el-popover",{ref:"menuListPopover",attrs:{placement:"top-start",trigger:"click"}},[n("el-tree",{ref:"menuListTree",attrs:{data:e.menuList,props:e.menuListTreeProps,"node-key":"menuId","default-expand-all":!0,"highlight-current":!0,"expand-on-click-node":!1},on:{"current-change":e.menuListTreeCurrentChangeHandle}})],1),e._v(" "),n("el-input",{directives:[{name:"popover",rawName:"v-popover:menuListPopover",arg:"menuListPopover"}],staticClass:"menu-list__input",attrs:{readonly:!0,placeholder:"点击选择上级菜单"},model:{value:e.dataForm.parentName,callback:function(t){e.$set(e.dataForm,"parentName",t)},expression:"dataForm.parentName"}})],1),e._v(" "),1===e.dataForm.type?n("el-form-item",{attrs:{label:"菜单路由",prop:"url"}},[n("el-input",{attrs:{placeholder:"菜单路由"},model:{value:e.dataForm.url,callback:function(t){e.$set(e.dataForm,"url",t)},expression:"dataForm.url"}})],1):e._e(),e._v(" "),0!==e.dataForm.type?n("el-form-item",{attrs:{label:"授权标识",prop:"perms"}},[n("el-input",{attrs:{placeholder:"多个用逗号分隔, 如: user:list,user:create"},model:{value:e.dataForm.perms,callback:function(t){e.$set(e.dataForm,"perms",t)},expression:"dataForm.perms"}})],1):e._e(),e._v(" "),2!==e.dataForm.type?n("el-form-item",{attrs:{label:"排序号",prop:"orderNum"}},[n("el-input-number",{attrs:{"controls-position":"right",min:0,label:"排序号"},model:{value:e.dataForm.orderNum,callback:function(t){e.$set(e.dataForm,"orderNum",t)},expression:"dataForm.orderNum"}})],1):e._e(),e._v(" "),2!==e.dataForm.type?n("el-form-item",{attrs:{label:"菜单图标",prop:"icon"}},[n("el-row",[n("el-col",[n("el-popover",{ref:"iconListPopover",attrs:{placement:"bottom-start",trigger:"click","popper-class":"mod-menu__icon-popover"}},[n("div",{staticClass:"mod-menu__icon-list"},e._l(e.iconList,function(t,a){return n("el-button",{key:a,class:{"is-active":t===e.dataForm.icon},on:{click:function(n){return e.iconActiveHandle(t)}}},[n("icon-svg",{attrs:{name:t}})],1)}),1)]),e._v(" "),n("el-input",{directives:[{name:"popover",rawName:"v-popover:iconListPopover",arg:"iconListPopover"}],staticClass:"icon-list__input",attrs:{readonly:!0,placeholder:"菜单图标名称"},model:{value:e.dataForm.icon,callback:function(t){e.$set(e.dataForm,"icon",t)},expression:"dataForm.icon"}})],1)],1)],1):e._e()],1),e._v(" "),n("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),n("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]};var i=n("VU/8")(r,o,!1,function(e){n("w1FO")},null,null);t.default=i.exports},gpws:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var a=n("7+Dk"),r=n("cFZF"),o={data:function(){return{searchForm:{},dataList:[],addOrUpdateVisible:!1}},components:{TableTreeColumn:a.a,AddOrUpdate:r.default},activated:function(){this.getDataList()},methods:{getDataList:function(){var e=this;this.$http({url:"/sys/menu/list",method:"get"}).then(function(t){var n=t.data;e.dataList=e.treeDataTranslate(n.menuList,"menuId","parentId","childrens")})},addOrUpdateHandle:function(e){var t=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){t.$refs.addOrUpdate.init(e)})},deleteHandle:function(e){var t=this;this.$confirm("确定对[id="+e+"]进行[删除]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){t.$http({url:"/sys/menu/delete/"+e,method:"post"}).then(function(e){var n=e.data;n&&0===n.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.getDataList())})}).catch(function(){})}}},i={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"mod-menu"},[n("el-form",{attrs:{inline:!0,model:e.searchForm}},[n("el-form-item",[e.isAuth("sys:menu:save")?n("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.addOrUpdateHandle()}}},[e._v("新增")]):e._e()],1)],1),e._v(" "),n("el-table",{staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""}},[n("el-table-column",{attrs:{prop:"menuId","header-align":"center",align:"left",width:"80",label:"ID"}}),e._v(" "),n("table-tree-column",{attrs:{prop:"name","header-align":"center",treeKey:"menuId",width:"150",label:"名称"}}),e._v(" "),n("el-table-column",{attrs:{prop:"parentName","header-align":"center",align:"center",width:"120",label:"上级菜单"}}),e._v(" "),n("el-table-column",{attrs:{"header-align":"center",align:"center",label:"图标"},scopedSlots:e._u([{key:"default",fn:function(e){return[n("icon-svg",{attrs:{name:e.row.icon||""}})]}}])}),e._v(" "),n("el-table-column",{attrs:{prop:"type","header-align":"center",align:"center",label:"类型"},scopedSlots:e._u([{key:"default",fn:function(t){return[0===t.row.type?n("el-tag",{attrs:{size:"small"}},[e._v("目录")]):1===t.row.type?n("el-tag",{attrs:{size:"small",type:"success"}},[e._v("菜单")]):2===t.row.type?n("el-tag",{attrs:{size:"small",type:"info"}},[e._v("按钮")]):e._e()]}}])}),e._v(" "),n("el-table-column",{attrs:{prop:"orderNum","header-align":"center",align:"center",label:"排序号"}}),e._v(" "),n("el-table-column",{attrs:{prop:"url","header-align":"center",align:"center",width:"150","show-overflow-tooltip":!0,label:"菜单URL"}}),e._v(" "),n("el-table-column",{attrs:{prop:"perms","header-align":"center",align:"center",width:"150","show-overflow-tooltip":!0,label:"授权标识"}}),e._v(" "),n("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.isAuth("sys:menu:update")?n("el-button",{attrs:{type:"text",size:"small"},on:{click:function(n){return e.addOrUpdateHandle(t.row.menuId)}}},[e._v("修改\n        ")]):e._e(),e._v(" "),e.isAuth("sys:menu:delete")?n("el-button",{attrs:{type:"text",size:"small"},on:{click:function(n){return e.deleteHandle(t.row.menuId)}}},[e._v("\n          删除\n        ")]):e._e()]}}])})],1),e._v(" "),e.addOrUpdateVisible?n("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:e.getDataList}}):e._e()],1)},staticRenderFns:[]};var l=n("VU/8")(o,i,!1,function(e){n("mfsL")},null,null);t.default=l.exports},mfsL:function(e,t,n){var a=n("ojO5");"string"==typeof a&&(a=[[e.i,a,""]]),a.locals&&(e.exports=a.locals);n("rjj0")("4ec22880",a,!0,{})},ojO5:function(e,t,n){(e.exports=n("FZ+f")(!1)).push([e.i,"\n.el-popper {\n  max-height: 500px;\n  max-width: 200px;\n  overflow-x: hidden;\n  overflow-y: auto;\n}\n",""])},w1FO:function(e,t,n){var a=n("WcdF");"string"==typeof a&&(a=[[e.i,a,""]]),a.locals&&(e.exports=a.locals);n("rjj0")("24e0573c",a,!0,{})}});