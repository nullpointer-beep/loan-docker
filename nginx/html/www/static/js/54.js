webpackJsonp([54],{YQzm:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=a("vxIZ"),r=a("3K1a"),i=a("mZK9"),s={data:function(){return{auditStatusMap:{D:"待审核",Y:"审核通过",N:"审核驳回"},remitMap:{Y:"已打款",N:"未打款"},withdrawStatustMap:{D:"未申请提现",C:"已提交，待处理",Y:"审核通过",N:"审核驳回"},orderStatusMap:[],searchForm:{mobile:"",orderId:"",auditStatus:"",orderStatus:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListSelections:[],addOrUpdateVisible:!1,statusChangeVisible:!1,modifyBankVisible:!1}},components:{AddOrUpdate:n.default,StatusChange:r.default,ModifyBank:i.default},activated:function(){this.getOrderStatusMap(),this.getDataList()},methods:{getOrderStatusMap:function(){var t=this;this.$http({url:"/sys/common/getAllDict/LOAN_ORDER_STATUS",method:"get",params:{}}).then(function(e){var a=e.data;a&&0===a.code?t.orderStatusMap=a.map:t.orderStatusMap=[]})},showModifyBank:function(t){var e=this;this.modifyBankVisible=!0,this.$nextTick(function(){e.$refs.modifyBank.init(t)})},getDataList:function(){var t=this;this.$http({url:"/mall/loanorder/list",method:"get",params:{page:this.pageIndex,limit:this.pageSize,mobile:this.searchForm.mobile,orderStatus:this.searchForm.orderStatus,auditStatus:this.searchForm.auditStatus,orderId:this.searchForm.orderId,isDel:"Y"}}).then(function(e){var a=e.data;a&&0===a.code?(t.dataList=a.page.records,t.totalPage=a.page.total):(t.dataList=[],t.totalPage=0)})},sizeChangeHandle:function(t){this.pageSize=t,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(t){this.pageIndex=t,this.getDataList()},selectionChangeHandle:function(t){this.dataListSelections=t},showDetails:function(t){var e=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){e.$refs.addOrUpdate.init(t,!0)})},searchWalletInfo:function(t){this.$router.push({name:"mall-user-wallet",query:{mobile:t}})},auditOrder:function(t,e){var a=this,n="Y"===e?"通过":"驳回";this.$prompt("请输入审核备注","审核"+n,{confirmButtonText:n,cancelButtonText:"取消",inputValue:n}).then(function(n){var r=n.value;a.$http({url:"/mall/loanorder/audit",method:"post",data:{id:t,auditType:e,remark:r}}).then(function(t){var e=t.data;e&&0===e.code&&(a.$message({message:"操作成功",type:"success",duration:1500}),a.getDataList())})}).catch(function(){a.$message({type:"info",message:"取消审核"+n})})},addOrUpdateHandle:function(t){var e=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){e.$refs.addOrUpdate.init(t)})},changeStatus:function(t){var e=this;this.statusChangeVisible=!0,this.$nextTick(function(){e.$refs.statusChange.init(t)})},remit:function(t,e){var a=this;this.$prompt("请输入金额","打款",{confirmButtonText:"确定",cancelButtonText:"取消",inputValue:e,inputPattern:/(^[1-9]\d*$)/,inputErrorMessage:"金额格式不正确"}).then(function(e){var n=e.value;a.$http({url:"/mall/loanorder/remit",method:"post",data:{id:t,amount:n}}).then(function(t){var e=t.data;e&&0===e.code&&(a.$message({message:"操作成功",type:"success",duration:1500}),a.getDataList())})}).catch(function(){a.$message({type:"info",message:"取消打款"})})},changeAmount:function(t,e){var a=this;this.$prompt("借款金额","修改借款金额",{confirmButtonText:"确定",cancelButtonText:"取消",inputValue:e,inputPattern:/^[0-9]\d*$/,inputErrorMessage:"借款金额需要为整数"}).then(function(e){var n=e.value;a.$http({url:"/mall/loanorder/changeamount",method:"post",data:{id:t,amount:n}}).then(function(t){var e=t.data;e&&0===e.code&&(a.$message({message:"操作成功",type:"success",duration:1500}),a.getDataList())})}).catch(function(){a.$message({type:"info",message:"取消修改借款金额"})})},changePeriod:function(t,e){var a=this;this.$prompt("借款期限","修改借款期限",{confirmButtonText:"确定",cancelButtonText:"取消",inputValue:e,inputPattern:/^[0-9]\d*$/,inputErrorMessage:"借款期限需要为整数"}).then(function(e){var n=e.value;a.$http({url:"/mall/loanorder/changeperiod",method:"post",data:{id:t,period:n}}).then(function(t){var e=t.data;e&&0===e.code&&(a.$message({message:"操作成功",type:"success",duration:1500}),a.getDataList())})}).catch(function(){a.$message({type:"info",message:"取消修改借款期限"})})},showDetailInfo:function(t,e){this.$router.push({name:"mall-userdetail-info",query:{userId:t,modify:e}})},deleteHandle:function(t){var e=this,a=t?[t]:this.dataListSelections.map(function(t){return t.id});this.$confirm("确定对[id="+a.join(",")+"]进行[删除]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){e.$http({url:"/mall/loanorder/delete",method:"post",data:a}).then(function(t){var a=t.data;a&&0===a.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.getDataList())})}).catch(function(){})}}},o={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"mod-loanorder"},[a("el-form",{attrs:{inline:!0,model:t.searchForm},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"手机号",clearable:""},model:{value:t.searchForm.mobile,callback:function(e){t.$set(t.searchForm,"mobile",e)},expression:"searchForm.mobile"}})],1),t._v(" "),a("el-form-item",[a("el-input",{attrs:{placeholder:"订单号",clearable:""},model:{value:t.searchForm.orderId,callback:function(e){t.$set(t.searchForm,"orderId",e)},expression:"searchForm.orderId"}})],1),t._v(" "),a("el-form-item",[a("el-select",{attrs:{clearable:"",placeholder:"审核状态"},model:{value:t.searchForm.auditStatus,callback:function(e){t.$set(t.searchForm,"auditStatus",e)},expression:"searchForm.auditStatus"}},t._l(t.auditStatusMap,function(t,e,n){return a("el-option",{key:n,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",[a("el-select",{attrs:{clearable:"",placeholder:"订单状态"},model:{value:t.searchForm.orderStatus,callback:function(e){t.$set(t.searchForm,"orderStatus",e)},expression:"searchForm.orderStatus"}},t._l(t.orderStatusMap,function(t,e,n){return a("el-option",{key:n,attrs:{label:t,value:e}})}),1)],1),t._v(" "),a("el-form-item",[a("el-button",{on:{click:function(e){return t.getDataList()}}},[t._v("查询")]),t._v(" "),t.isAuth("mall:loanorder:save")?a("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.addOrUpdateHandle()}}},[t._v("新增")]):t._e(),t._v(" "),t.isAuth("mall:loanorder:delete")?a("el-button",{attrs:{type:"danger",disabled:t.dataListSelections.length<=0},on:{click:function(e){return t.deleteHandle()}}},[t._v("批量删除")]):t._e()],1)],1),t._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.dataList,border:""},on:{"selection-change":t.selectionChangeHandle}},[a("el-table-column",{attrs:{prop:"mobile","header-align":"center",align:"center",label:"手机号"}}),t._v(" "),a("el-table-column",{attrs:{prop:"orderId","header-align":"center",align:"center",label:"订单号"}}),t._v(" "),a("el-table-column",{attrs:{prop:"amount","header-align":"center",align:"center",label:"借款金额"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"small"},on:{click:function(a){return t.changeAmount(e.row.id,e.row.amount)}}},[t._v("\n       "+t._s(e.row.amount)+"\n      ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"amount","header-align":"center",align:"center",label:"借款期限"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"small"},on:{click:function(a){return t.changePeriod(e.row.id,e.row.period)}}},[t._v("\n       "+t._s(e.row.period)+" \n      ")]),t._v("\n      个月\n      ")]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"createTime","header-align":"center",align:"center",label:"创建时间"}}),t._v(" "),a("el-table-column",{attrs:{prop:"auditStatus","header-align":"center",align:"center",label:"审核状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-tag",{attrs:{size:"small",type:"D"==e.row.auditStatus?"gray":"Y"==e.row.auditStatus?"success":"warning"}},[t._v("\n       "+t._s(t.auditStatusMap[e.row.auditStatus])+"\n      ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"orderStatus","header-align":"center",align:"center",label:"订单状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"small"},on:{click:function(a){return t.changeStatus(e.row.id)}}},[t._v("\n       "+t._s(t.orderStatusMap[e.row.orderStatus])+"\n      ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"isRemit","header-align":"center",align:"center",label:"是否已打款"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"small",disabled:"Y"==e.row.isRemit,type:"Y"==e.row.isRemit?"success":"gray"},on:{click:function(a){return t.remit(e.row.id,e.row.amount)}}},[t._v("\n       "+t._s(t.remitMap[e.row.isRemit])+"\n      ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{prop:"withdrawStatus","header-align":"center",align:"center",label:"提现状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("el-button",{attrs:{size:"small",type:"D"==e.row.withdrawStatus?"gray":"C"==e.row.withdrawStatus?"danger":"Y"==e.row.withdrawStatus?"success":"warning"},on:{click:function(a){return t.searchWalletInfo(e.row.mobile)}}},[t._v("\n       "+t._s(t.withdrawStatustMap[e.row.withdrawStatus])+"\n      ")])]}}])}),t._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[t.isAuth("mall:userdetail:searchinfo")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.showDetailInfo(e.row.id,0)}}},[t._v("查看资料")]):t._e(),t._v(" "),t.isAuth("mall:userdetail:update")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.showDetailInfo(e.row.id,1)}}},[t._v("修改资料")]):t._e(),t._v(" "),t.isAuth("mall:loanorder:delete")?a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return t.deleteHandle(e.row.id)}}},[t._v("删除")]):t._e()]}}])})],1),t._v(" "),a("el-pagination",{attrs:{"current-page":t.pageIndex,"page-sizes":[10,20,50,100],"page-size":t.pageSize,total:t.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":t.sizeChangeHandle,"current-change":t.currentChangeHandle}}),t._v(" "),t.addOrUpdateVisible?a("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:t.getDataList}}):t._e(),t._v(" "),t.statusChangeVisible?a("status-change",{ref:"statusChange",on:{refreshDataList:t.getDataList}}):t._e(),t._v(" "),t.modifyBankVisible?a("modify-bank",{ref:"modifyBank",on:{refreshDataList:t.getDataList}}):t._e()],1)},staticRenderFns:[]},l=a("VU/8")(s,o,!1,null,null,null);e.default=l.exports}});