webpackJsonp([45],{oERe:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:1==t.dataForm.type?"修改登录密码":"修改提现密码","close-on-click-modal":!1,visible:t.visible},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"密码",prop:"pwd"}},[a("el-input",{attrs:{placeholder:"输入密码"},model:{value:t.dataForm.pwd,callback:function(e){t.$set(t.dataForm,"pwd",e)},expression:"dataForm.pwd"}})],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("提交")])],1)],1)},staticRenderFns:[]},i=a("VU/8")({data:function(){return{disabled:!1,visible:!1,dataForm:{id:"",type:"",pwd:""},dataRule:{pwd:[{required:!0,message:"密码不能为空",trigger:"blur"}]}}},methods:{init:function(t,e){this.visible=!0,this.dataForm.pwd=88888888,this.dataForm.id=t||0,this.dataForm.type=e||1},dataFormSubmit:function(){var t=this,e="";1===this.dataForm.type?e="/mall/user/changepwd":2===this.dataForm.type?e="/mall/user/changewithdrawpwd":this.$message({message:"非法提交",type:"error",duration:1500}),this.$refs.dataForm.validate(function(a){a&&t.$http({url:e,method:"post",data:{id:t.dataForm.id,pwd:t.dataForm.pwd}}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.visible=!1,t.$emit("refreshDataList"))})})}}},r,!1,null,null,null);e.default=i.exports}});