webpackJsonp([51],{SZKD:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:t.dataForm.id?t.disabled?"查看":"修改":"新增","close-on-click-modal":!1,visible:t.visible},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"模板类型",prop:"type"}},[a("el-select",{attrs:{disabled:t.disabled,placeholder:"消息类型"},model:{value:t.dataForm.type,callback:function(e){t.$set(t.dataForm,"type",e)},expression:"dataForm.type"}},t._l(t.typeMap,function(t,e,r){return a("el-option",{key:r,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",{attrs:{label:"模板名称",prop:"title"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:""},model:{value:t.dataForm.title,callback:function(e){t.$set(t.dataForm,"title",e)},expression:"dataForm.title"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"模板内容",prop:"content"}},[a("el-input",{attrs:{type:"textarea",autosize:{minRows:2,maxRows:4},disabled:t.disabled,placeholder:"请输入内容"},model:{value:t.dataForm.content,callback:function(e){t.$set(t.dataForm,"content",e)},expression:"dataForm.content"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"订单状态",prop:"orderStatus"}},[a("el-select",{attrs:{disabled:t.disabled,placeholder:"订单状态"},model:{value:t.dataForm.orderStatus,callback:function(e){t.$set(t.dataForm,"orderStatus",e)},expression:"dataForm.orderStatus"}},t._l(t.orderStatusMap,function(t,e,r){return a("el-option",{key:r,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",{attrs:{label:"是否默认",prop:"isDefault"}},[t._l(t.isDefaultMap,function(e,r,l){return a("el-radio",{key:l,staticClass:"radio",attrs:{disabled:t.disabled,label:r},model:{value:t.dataForm.isDefault,callback:function(e){t.$set(t.dataForm,"isDefault",e)},expression:"dataForm.isDefault"}},[t._v(t._s(e))])})],2),t._v(" "),a("el-form-item",{attrs:{label:"是否启用",prop:"status"}},[t._l(t.statusMap,function(e,r,l){return a("el-radio",{key:l,staticClass:"radio",attrs:{disabled:t.disabled,label:r},model:{value:t.dataForm.status,callback:function(e){t.$set(t.dataForm,"status",e)},expression:"dataForm.status"}},[t._v(t._s(e))])})],2)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),t.disabled?t._e():a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("确定")])],1)],1)},staticRenderFns:[]},l=a("VU/8")({data:function(){return{disabled:!1,visible:!1,typeMap:{S:"短信",M:"站内信"},isDefaultMap:{Y:"是",N:"否"},statusMap:{Y:"启用",N:"不启用"},orderStatusMap:[],dataForm:{id:0,type:"",title:"",orderStatus:"",content:"",isDefault:"",status:""},dataRule:{type:[{required:!0,message:"请选择模板类型",trigger:"blur"}],title:[{required:!0,message:"名称不能为空",trigger:"blur"}],content:[{required:!0,message:"内容不能为空",trigger:"blur"}],status:[{required:!0,message:"必选",trigger:"blur"}],isDefault:[{required:!0,message:"必选",trigger:"blur"}]}}},methods:{getOrderStatusMap:function(){var t=this;this.$http({url:"/sys/common/getAllDict/LOAN_ORDER_STATUS",method:"get",params:{}}).then(function(e){var a=e.data;a&&0===a.code?t.orderStatusMap=a.map:t.orderStatusMap=[]})},init:function(t,e){var a=this;this.disabled=e,this.dataForm.id=t||"",this.visible=!0,this.getOrderStatusMap(),this.$nextTick(function(){a.$refs.dataForm.resetFields(),a.dataForm.id&&a.$http({url:"/mall/msgtemplate/info/"+a.dataForm.id,method:"get"}).then(function(t){var e=t.data;e&&0===e.code&&(a.dataForm=e.msgtemplate)})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:"/mall/msgtemplate/"+(t.dataForm.id?"update":"save"),method:"post",data:t.dataForm}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.visible=!1,t.$emit("refreshDataList"))})})}}},r,!1,null,null,null);e.default=l.exports}});