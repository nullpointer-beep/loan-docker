webpackJsonp([61],{gxTB:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"80px"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"模型名称",prop:"name"}},[a("el-input",{attrs:{placeholder:"模型名称"},model:{value:e.dataForm.name,callback:function(t){e.$set(e.dataForm,"name",t)},expression:"dataForm.name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"模型标识",prop:"key"}},[a("el-input",{attrs:{placeholder:"模型标识"},model:{value:e.dataForm.key,callback:function(t){e.$set(e.dataForm,"key",t)},expression:"dataForm.key"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"模型描述",prop:"description"}},[a("el-input",{attrs:{placeholder:"模型描述"},model:{value:e.dataForm.description,callback:function(t){e.$set(e.dataForm,"description",t)},expression:"dataForm.description"}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")({data:function(){return{visible:!1,dataForm:{name:"",key:"",description:""},dataRule:{name:[{required:!0,message:"模型名称不能为空",trigger:"blur"}],key:[{required:!0,message:"模型标识不能为空",trigger:"blur"}],description:[{required:!0,message:"模型描述不能为空",trigger:"blur"}]}}},methods:{init:function(e){var t=this;this.dataForm.id=e||"",this.visible=!0,this.$nextTick(function(){t.$refs.dataForm.resetFields()})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:"/act/remodel/"+(e.dataForm.id?"update":"save"),method:"post",data:e.dataForm}).then(function(t){var a=t.data;a&&0===a.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.visible=!1,e.$emit("refreshDataList"))})})}}},r,!1,null,null,null);t.default=i.exports}});