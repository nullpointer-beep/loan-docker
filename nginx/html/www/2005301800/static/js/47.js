webpackJsonp([47],{i54S:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"mod-msglog"},[n("el-card",{staticClass:"box-card"},[n("div",{staticClass:"clearfix",attrs:{slot:"header"},slot:"header"},[t.isAuth("sys:siteconfig:saveservicecontract")?n("el-button",{staticStyle:{float:"right"},attrs:{type:"primary"},on:{click:function(e){t.showContentModify=!0,t.dataForm.content=t.tplContent}}},[t._v("修改")]):t._e()],1),t._v(" "),n("div",[n("span",{ref:"imageDom",staticClass:"container",domProps:{innerHTML:t._s(t.tplContent)}})])]),t._v(" "),n("el-dialog",{attrs:{title:"修改服务协议",width:"75%",visible:t.showContentModify,size:"tiny"},on:{"update:visible":function(e){t.showContentModify=e}}},[n("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[n("el-form-item",{attrs:{label:"内容",prop:"content"}},[n("ueditor",{model:{value:t.dataForm.content,callback:function(e){t.$set(t.dataForm,"content",e)},expression:"dataForm.content"}})],1)],1),t._v(" "),n("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{on:{click:function(e){t.showContentModify=!1}}},[t._v("取 消")]),t._v(" "),n("el-button",{attrs:{type:"danger"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("修改文案")])],1)],1)],1)},staticRenderFns:[]},a=n("VU/8")({data:function(){return{showContentModify:!1,detailResult:!1,tplContent:"",dataForm:{content:""},dataRule:{content:[]}}},activated:function(){this.showContentModify=!1,this.getServiceContractInfo()},computed:{},methods:{getServiceContractInfo:function(){var t=this;this.$nextTick(function(){t.$http({url:"/mall/siteconfig/servicecontract",method:"get"}).then(function(e){var n=e.data;n&&0===n.code&&(t.tplContent=n.config.content||"")})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:"/mall/siteconfig/saveservicecontract",method:"post",data:t.dataForm}).then(function(e){var n=e.data;n&&0===n.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.tplContent=t.dataForm.content,t.showContentModify=!1)})})}}},o,!1,null,null,null);e.default=a.exports}});