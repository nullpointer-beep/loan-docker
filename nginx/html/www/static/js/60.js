webpackJsonp([60],{"1VN5":function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n={data:function(){return{searchForm:{category:"",key:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListSelections:[],visible:!1,url:"",fileList:[]}},activated:function(){this.getDataList()},methods:{getDataList:function(){var e=this;this.$http({url:"/act/reprocdef/list",method:"get",params:{page:this.pageIndex,limit:this.pageSize,category:this.searchForm.category,key:this.searchForm.key}}).then(function(t){var a=t.data;a&&0===a.code?(e.dataList=a.page.records,e.totalPage=a.page.total):(e.dataList=[],e.totalPage=0)})},sizeChangeHandle:function(e){this.pageSize=e,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(e){this.pageIndex=e,this.getDataList()},selectionChangeHandle:function(e){this.dataListSelections=e},updateHandle:function(e,t){var a=this;this.$http({url:"/act/reprocdef/update?id="+e+"&state="+t,method:"post"}).then(function(e){var t=e.data;t&&0===t.code&&(a.$message({message:t.msg,type:"success",duration:2e3}),a.getDataList())})},convertToModel:function(e){var t=this;this.$http({url:"/act/reprocdef/convertToModel?id="+e,method:"post"}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:2e3}),t.getDataList())})},read:function(e,t){var a=this.$http.BASE_URL+"/act/reprocdef/read?id="+e+"&resType="+t+"&token="+this.$cookie.get("token");window.open(a)},deployHandle:function(){this.visible=!0,this.url=this.$http.BASE_URL+"/act/reprocdef/deploy?token="+this.$cookie.get("token")},deleteHandle:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.deploymentId});this.$confirm("确定对[id="+a.join(",")+"]进行[删除]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){t.$http({url:"/act/reprocdef/delete",method:"post",data:a}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.getDataList())})}).catch(function(){})},beforeUploadHandle:function(e){if(!(e.name.endsWith("zip")||e.name.endsWith("bar")||e.name.endsWith("bpmn")||e.name.endsWith("bpmn20.xml")))return this.$message.error("只支持zip、bar、bpmn、bpmn20.xml格式的图片！"),!1},successHandle:function(e,t,a){this.fileList=a,e&&0===e.code?(this.$message({message:e.msg,type:"success",duration:2e3}),this.getDataList()):this.$message.error(e.msg),this.visible=!1},closeHandle:function(){this.fileList=[],this.$emit("refreshDataList")}}},r={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"mod-reprocdef"},[a("el-form",{attrs:{inline:!0,model:e.searchForm},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"流程编号",clearable:""},model:{value:e.searchForm.key,callback:function(t){e.$set(e.searchForm,"key",t)},expression:"searchForm.key"}})],1),e._v(" "),a("el-form-item",[a("el-input",{attrs:{placeholder:"流程命名空间",clearable:""},model:{value:e.searchForm.category,callback:function(t){e.$set(e.searchForm,"category",t)},expression:"searchForm.category"}})],1),e._v(" "),a("el-form-item",[a("el-button",{on:{click:function(t){return e.getDataList()}}},[e._v("查询")]),e._v(" "),e.isAuth("act:reprocdef:deploy")?a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.deployHandle()}}},[e._v("部署流程文件")]):e._e(),e._v(" "),e.isAuth("act:reprocdef:delete")?a("el-button",{attrs:{type:"danger",disabled:e.dataListSelections.length<=0},on:{click:function(t){return e.deleteHandle()}}},[e._v("批量删除\n      ")]):e._e()],1)],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""},on:{"selection-change":e.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),e._v(" "),a("el-table-column",{attrs:{prop:"deploymentId","header-align":"center",align:"center",label:"部署编号"}}),e._v(" "),a("el-table-column",{attrs:{prop:"name","header-align":"center",align:"center",label:"流程名称"}}),e._v(" "),a("el-table-column",{attrs:{prop:"key","header-align":"center",align:"center",label:"流程编号"}}),e._v(" "),a("el-table-column",{attrs:{prop:"version","header-align":"center",align:"center",label:"流程版本号"}}),e._v(" "),a("el-table-column",{attrs:{prop:"category","header-align":"center",align:"center",label:"流程命名空间"}}),e._v(" "),a("el-table-column",{attrs:{prop:"resourceName","header-align":"center",align:"center",label:"资源文件"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("a",{attrs:{href:"javascript:;"},on:{click:function(a){return e.read(t.row.id,"xml")}}},[e._v(e._s(t.row.resourceName))])]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"dgrmResourceName","header-align":"center",align:"center",label:"图片资源文件"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("a",{attrs:{href:"javascript:;"},on:{click:function(a){return e.read(t.row.id,"image")}}},[e._v(e._s(t.row.dgrmResourceName))])]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"description","header-align":"center",align:"center",label:"描述信息"}}),e._v(" "),a("el-table-column",{attrs:{prop:"suspensionState","header-align":"center",align:"center",label:"是否挂起"},scopedSlots:e._u([{key:"default",fn:function(t){return[1===t.row.suspensionState?a("el-tag",{attrs:{size:"small",type:"success"}},[e._v("激活")]):2===t.row.suspensionState?a("el-tag",{attrs:{size:"small",type:"danger"}},[e._v("挂起")]):e._e()]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"deployTime","header-align":"center",align:"center",width:"160",label:"部署时间"}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"200",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.isAuth("act:reprocdef:update")&&2===t.row.suspensionState?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.updateHandle(t.row.id,1)}}},[e._v("激活\n        ")]):e._e(),e._v(" "),e.isAuth("act:reprocdef:update")&&1===t.row.suspensionState?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.updateHandle(t.row.id,2)}}},[e._v("挂起\n        ")]):e._e(),e._v(" "),e.isAuth("act:reprocdef:update")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.convertToModel(t.row.id)}}},[e._v("转为模型\n        ")]):e._e(),e._v(" "),e.isAuth("act:reprocdef:delete")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.deleteHandle(t.row.deploymentId)}}},[e._v("\n          删除\n        ")]):e._e()]}}])})],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.pageIndex,"page-sizes":[10,20,50,100],"page-size":e.pageSize,total:e.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.sizeChangeHandle,"current-change":e.currentChangeHandle}}),e._v(" "),a("el-dialog",{attrs:{title:"上传文件","close-on-click-modal":!1,visible:e.visible},on:{close:e.closeHandle,"update:visible":function(t){e.visible=t}}},[a("el-upload",{staticStyle:{"text-align":"center"},attrs:{drag:"",action:e.url,"before-upload":e.beforeUploadHandle,"on-success":e.successHandle,"file-list":e.fileList}},[a("i",{staticClass:"el-icon-upload"}),e._v(" "),a("div",{staticClass:"el-upload__text"},[e._v("将文件拖到此处，或"),a("em",[e._v("点击上传")])]),e._v(" "),a("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[e._v("支持文件格式：zip、bar、bpmn、bpmn20.xml")])])],1)],1)},staticRenderFns:[]},l=a("VU/8")(n,r,!1,null,null,null);t.default=l.exports}});