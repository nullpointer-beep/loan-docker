webpackJsonp([36],{"/D18":function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=a("E4LH"),i={data:function(){return{visible:!1,dataForm:{userId:""},dataRule:{email:[{required:!0,message:"邮箱不能为空",trigger:"blur"},{validator:function(e,t,a){Object(r.a)(t)?a():a(new Error("邮箱格式错误"))},trigger:"blur"}],emailHost:[{required:!0,message:"邮箱服务器地址不能为空",trigger:"blur"}],emailPw:[{required:!0,message:"邮箱密码不能为空",trigger:"blur"}]}}},methods:{init:function(){var e=this;this.visible=!0,this.$http({url:"/sys/user/info",method:"get"}).then(function(t){var a=t.data;a&&0===a.code&&(e.dataForm=a.user)})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:"/sys/maillog/config",method:"post",data:{userId:e.dataForm.userId,email:e.dataForm.email,emailHost:e.dataForm.emailHost,emailPw:e.dataForm.emailPw}}).then(function(t){var a=t.data;a&&0===a.code&&(e.visible=!1,e.$message({message:"操作成功",type:"success",duration:1500}),e.$emit("refreshDataList"))})})}}},l={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"100px"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"邮箱服务器",prop:"emailHost"}},[a("el-input",{attrs:{placeholder:"邮箱服务器地址"},model:{value:e.dataForm.emailHost,callback:function(t){e.$set(e.dataForm,"emailHost",t)},expression:"dataForm.emailHost"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"邮箱",prop:"email"}},[a("el-input",{attrs:{placeholder:"邮箱"},model:{value:e.dataForm.email,callback:function(t){e.$set(e.dataForm,"email",t)},expression:"dataForm.email"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"邮箱密码",prop:"emailPw"}},[a("el-input",{attrs:{placeholder:"邮箱密码"},model:{value:e.dataForm.emailPw,callback:function(t){e.$set(e.dataForm,"emailPw",t)},expression:"dataForm.emailPw"}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},o=a("VU/8")(i,l,!1,null,null,null);t.default=o.exports}});