webpackJsonp([50],{"6Ly2":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={components:{contentParamTag:a("7nEe").a},data:function(){return{disabled:!1,visible:!1,isDefaultMap:{Y:"是",N:"否"},stautsMap:{Y:"启用",N:"不启用"},orderStatusMap:[],dataForm:{id:0,title:"",content:"",orderStatus:"",status:"",isDefault:""},dataRule:{title:[{required:!0,message:"名称不能为空",trigger:"blur"}],status:[{required:!0,message:"不能为空",trigger:"blur"}],isDefault:[{required:!0,message:"不能为空",trigger:"blur"}],content:[{required:!0,message:"不能为空",trigger:"blur"}]}}},methods:{getOrderStatusMap:function(){var t=this;this.$http({url:"/sys/common/getAllDict/LOAN_ORDER_STATUS",method:"get",params:{}}).then(function(e){var a=e.data;a&&0===a.code?t.orderStatusMap=a.map:t.orderStatusMap=[]})},init:function(t,e){var a=this;this.disabled=e,this.dataForm.id=t||"",this.visible=!0,this.getOrderStatusMap(),this.$nextTick(function(){a.$refs.dataForm.resetFields(),a.dataForm.id&&a.$http({url:"/mall/orderstatustext/info/"+a.dataForm.id,method:"get"}).then(function(t){var e=t.data;e&&0===e.code&&(a.dataForm=e.orderstatustext)})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:"/mall/orderstatustext/"+(t.dataForm.id?"update":"save"),method:"post",data:t.dataForm}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.visible=!1,t.$emit("refreshDataList"))})})}}},s={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:t.dataForm.id?t.disabled?"查看":"修改":"新增","close-on-click-modal":!1,visible:t.visible,width:"100%"},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"标题",prop:"title"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:"标题"},model:{value:t.dataForm.title,callback:function(e){t.$set(t.dataForm,"title",e)},expression:"dataForm.title"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"订单状态",prop:"orderStatus"}},[a("el-select",{attrs:{disabled:t.disabled,placeholder:"订单状态"},model:{value:t.dataForm.orderStatus,callback:function(e){t.$set(t.dataForm,"orderStatus",e)},expression:"dataForm.orderStatus"}},t._l(t.orderStatusMap,function(t,e,r){return a("el-option",{key:r,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",{attrs:{label:"是否默认",prop:"isDefault"}},[[a("el-switch",{attrs:{"active-value":"Y","active-text":"是","inactive-value":"N","inactive-text":"否"},model:{value:t.dataForm.isDefault,callback:function(e){t.$set(t.dataForm,"isDefault",e)},expression:"dataForm.isDefault"}})]],2),t._v(" "),a("el-form-item",{attrs:{label:"是否启用",prop:"status"}},[[a("el-switch",{attrs:{"active-value":"Y","active-text":"启用","inactive-value":"N","inactive-text":"不启用"},model:{value:t.dataForm.status,callback:function(e){t.$set(t.dataForm,"status",e)},expression:"dataForm.status"}})]],2),t._v(" "),a("el-form-item",{attrs:{label:"",prop:"content"}},[a("content-param-tag"),t._v(" "),a("ueditor",{model:{value:t.dataForm.content,callback:function(e){t.$set(t.dataForm,"content",e)},expression:"dataForm.content"}})],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),t.disabled?t._e():a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")(r,s,!1,null,null,null);e.default=i.exports}});