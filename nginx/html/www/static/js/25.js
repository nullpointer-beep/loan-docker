webpackJsonp([25,56],{XqLz:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={components:{singleUpload:a("z009").a},data:function(){return{disabled:!1,visible:!1,statusMap:{1:"正常",0:"禁用"},dataForm:{id:0,imgUrl:"",title:"",sort:"",status:1},dataRule:{title:[{required:!0,message:"名称不能为空",trigger:"blur"}],imgUrl:[{required:!0,message:"不能为空",trigger:"blur"}],sort:[{required:!0,message:"不能为空",trigger:"blur"},{validator:function(t,e,a){""===e||/(^[1-9]\d*$)/.test(e)?parseInt(e)>9999999?a(new Error("不能大于9999999")):a():a(new Error("数字不合法"))},trigger:"blur"}]}}},methods:{init:function(t,e){var a=this;this.disabled=e,this.dataForm.id=t||"",this.visible=!0,this.$nextTick(function(){a.$refs.dataForm.resetFields(),a.dataForm.id&&a.$http({url:"/mall/banner/info/"+a.dataForm.id,method:"get"}).then(function(t){var e=t.data;e&&0===e.code&&(a.dataForm=e.banner)})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:"/mall/banner/"+(t.dataForm.id?"update":"save"),method:"post",data:t.dataForm}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.visible=!1,t.$emit("refreshDataList"))})})}}},n={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:t.dataForm.id?t.disabled?"查看":"修改":"新增","close-on-click-modal":!1,visible:t.visible},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"标题",prop:"title"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:"标题"},model:{value:t.dataForm.title,callback:function(e){t.$set(t.dataForm,"title",e)},expression:"dataForm.title"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"反面",prop:"imgUrl"}},[a("single-upload",{attrs:{disabled:t.disabled},model:{value:t.dataForm.imgUrl,callback:function(e){t.$set(t.dataForm,"imgUrl",e)},expression:"dataForm.imgUrl"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"排序",prop:"sort"}},[a("el-input",{attrs:{disabled:t.disabled,placeholder:"越大优先级越高"},model:{value:t.dataForm.sort,callback:function(e){t.$set(t.dataForm,"sort",e)},expression:"dataForm.sort"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"状态",prop:"status"}},[a("el-radio-group",{attrs:{disabled:t.disabled},model:{value:t.dataForm.status,callback:function(e){t.$set(t.dataForm,"status",e)},expression:"dataForm.status"}},[a("el-radio",{attrs:{label:1,border:""}},[t._v("正常")]),t._v(" "),a("el-radio",{attrs:{label:0,border:""}},[t._v("禁用")])],1)],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),t.disabled?t._e():a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.dataFormSubmit()}}},[t._v("确定")])],1)],1)},staticRenderFns:[]},l=a("VU/8")(r,n,!1,null,null,null);e.default=l.exports},pAY5:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r={data:function(){return{statusMap:{1:"正常",0:"禁用"},searchForm:{title:"",status:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListSelections:[],addOrUpdateVisible:!1}},components:{AddOrUpdate:a("XqLz").default},activated:function(){this.getDataList()},methods:{showImg:function(t){this.$alert('<img src="'+t+'" style="width: 100%">',"查看图片",{dangerouslyUseHTMLString:!0,confirmButtonText:"关闭",callback:function(t){}})},getDataList:function(){var t=this;this.$http({url:"/mall/banner/list",method:"get",params:{page:this.pageIndex,limit:this.pageSize,title:this.searchForm.title,status:this.searchForm.status}}).then(function(e){var a=e.data;a&&0===a.code?(t.dataList=a.page.records,t.totalPage=a.page.total):(t.dataList=[],t.totalPage=0)})},sizeChangeHandle:function(t){this.pageSize=t,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(t){this.pageIndex=t,this.getDataList()},selectionChangeHandle:function(t){this.dataListSelections=t},showDetails:function(t){var e=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){e.$refs.addOrUpdate.init(t,!0)})},addOrUpdateHandle:function(t){var e=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){e.$refs.addOrUpdate.init(t)})},deleteHandle:function(t){var e=this,a=t?[t]:this.dataListSelections.map(function(t){return t.id});this.$confirm("确定对其进行[删除]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){e.$http({url:"/mall/banner/delete",method:"post",data:a}).then(function(t){var a=t.data;a&&0===a.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.getDataList())})}).catch(function(){})}}},n={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"mod-banner"},[a("el-form",{attrs:{inline:!0,model:t.searchForm},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"标题",clearable:""},model:{value:t.searchForm.title,callback:function(e){t.$set(t.searchForm,"title",e)},expression:"searchForm.title"}})],1),t._v(" "),a("el-form-item",[a("el-select",{attrs:{clearable:"",placeholder:"是否启用"},model:{value:t.searchForm.status,callback:function(e){t.$set(t.searchForm,"status",e)},expression:"searchForm.status"}},t._l(t.statusMap,function(t,e,r){return a("el-option",{key:r,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",[a("el-button",{on:{click:function(e){return t.getDataList()}}},[t._v("查询")]),t._v(" "),t.isAuth("mall:banner:save")?a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.addOrUpdateHandle()}}},[t._v("新增")]):t._e(),t._v(" "),t.isAuth("mall:banner:delete")?a("el-button",{attrs:{type:"danger",disabled:t.dataListSelections.length<=0},on:{click:function(e){return t.deleteHandle()}}},[t._v("批量删除")]):t._e()],1)],1),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.dataList,border:""},on:{"selection-change":t.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),t._v(" "),a("el-table-column",{attrs:{prop:"type","header-align":"center",align:"center",label:"图片"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.showImg(e.row.imgUrl)}}},[t._v("预览")])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"title","header-align":"center",align:"center",label:"标题"}}),t._v(" "),a("el-table-column",{attrs:{prop:"sort","header-align":"center",align:"center",label:"越大优先级越高"}}),t._v(" "),a("el-table-column",{attrs:{prop:"type","header-align":"center",align:"center",label:"状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(t.statusMap[e.row.status]))]}}])}),t._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[t.isAuth("mall:banner:info")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.showDetails(e.row.id)}}},[t._v("查看")]):t._e(),t._v(" "),t.isAuth("mall:banner:update")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.addOrUpdateHandle(e.row.id)}}},[t._v("修改")]):t._e(),t._v(" "),t.isAuth("mall:banner:delete")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.deleteHandle(e.row.id)}}},[t._v("删除")]):t._e()]}}])})],1),t._v(" "),a("el-pagination",{attrs:{"current-page":t.pageIndex,"page-sizes":[10,20,50,100],"page-size":t.pageSize,total:t.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":t.sizeChangeHandle,"current-change":t.currentChangeHandle}}),t._v(" "),t.addOrUpdateVisible?a("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:t.getDataList}}):t._e()],1)},staticRenderFns:[]},l=a("VU/8")(r,n,!1,null,null,null);e.default=l.exports}});