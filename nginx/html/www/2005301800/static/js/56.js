webpackJsonp([56],{XqLz:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={components:{singleUpload:a("z009").a},data:function(){return{disabled:!1,visible:!1,statusMap:{1:"正常",0:"禁用"},dataForm:{id:0,imgUrl:"",title:"",sort:"",status:1},dataRule:{title:[{required:!0,message:"名称不能为空",trigger:"blur"}],imgUrl:[{required:!0,message:"不能为空",trigger:"blur"}],sort:[{required:!0,message:"不能为空",trigger:"blur"},{validator:function(t,e,a){""===e||/(^[1-9]\d*$)/.test(e)?parseInt(e)>9999999?a(new Error("不能大于9999999")):a():a(new Error("数字不合法"))},trigger:"blur"}]}}},methods:{init:function(t,e){var a=this;this.disabled=e,this.dataForm.id=t||"",this.visible=!0,this.$nextTick(function(){a.$refs.dataForm.resetFields(),a.dataForm.id&&a.$http({url:"/mall/banner/info/"+a.dataForm.id,method:"get"}).then(function(t){var e=t.data;e&&0===e.code&&(a.dataForm=e.banner)})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:"/mall/banner/"+(t.dataForm.id?"update":"save"),method:"post",data:t.dataForm}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.visible=!1,t.$emit("refreshDataList"))})})}}},l={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:t.dataForm.id?t.disabled?"查看":"修改":"新增","close-on-click-modal":!1,visible:t.visible},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"标题",prop:"title"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:"标题"},model:{value:t.dataForm.title,callback:function(e){t.$set(t.dataForm,"title",e)},expression:"dataForm.title"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"反面",prop:"imgUrl"}},[a("single-upload",{attrs:{disabled:t.disabled},model:{value:t.dataForm.imgUrl,callback:function(e){t.$set(t.dataForm,"imgUrl",e)},expression:"dataForm.imgUrl"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"排序",prop:"sort"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:"越大优先级越高"},model:{value:t.dataForm.sort,callback:function(e){t.$set(t.dataForm,"sort",e)},expression:"dataForm.sort"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"状态",prop:"status"}},[a("el-radio-group",{attrs:{disabled:t.disabled},model:{value:t.dataForm.status,callback:function(e){t.$set(t.dataForm,"status",e)},expression:"dataForm.status"}},[a("el-radio",{attrs:{label:1,border:""}},[t._v("正常")]),t._v(" "),a("el-radio",{attrs:{label:0,border:""}},[t._v("禁用")])],1)],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),t.disabled?t._e():a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")(r,l,!1,null,null,null);e.default=i.exports}});