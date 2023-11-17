"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[692],{692:(t,a,s)=>{s.r(a),s.d(a,{default:()=>o});var e=s(5888),r=s(4016);const i={name:"notification",data:function(){return{current:"notification",loading:!1,is_shimmer:!1}},components:{user_sidebar:e.Z,shimmer:r.Z},mounted:function(){0==this.lengthCounter(this.notification.data)&&this.notification(),this.lengthCounter(this.notification.data)>0&&(this.is_shimmer=!0)},computed:{notifications:function(){return this.$store.getters.getNotifications},shimmer:function(){return this.$store.state.module.shimmer}},methods:{notification:function(){var t=this,a=this.getUrl("user-notification/all");this.$Progress.start(),axios.get(a).then((function(a){t.is_shimmer=!0,t.$store.commit("setShimmer",0),t.$Progress.finish(),t.$store.commit("setNotifications",a.data.notifications)})).catch((function(a){t.$Progress.fail()}))},seenAll:function(){var t=this,a=this.getUrl("user-notification/seen-all");axios.get(a).then((function(a){if(a.data.error)toastr.error(a.data.error,t.lang.Error+" !!");else for(var s=0;s<t.notifications.data.length;s++)t.fetchedNotifications[s].status="seen"})).catch((function(a){t.$Progress.fail()}))},seen:function(t,a,s){var e=this,r=this.getUrl("notification/seen/"+t);axios.get(r).then((function(t){if(t.data.error)toastr.error(t.data.error,e.lang.Error+" !!");else if(e.notifications.data[a].status="seen","url"==s){var r=e.notifications.data[a].url.split("/");e.$router.push({name:"get.invoice",params:{orderCode:r[r.length-1]}})}}))},remove:function(t,a){var s=this,e=this.getUrl("notification/remove/"+t);axios.get(e).then((function(t){t.data.error?toastr.error(t.data.error,s.lang.Error+" !!"):(s.notifications.data.splice(a,1),s.notifications.total-=1)}))}}};var n=(0,s(1900).Z)(i,(function(){var t=this,a=t._self._c;return a("div",{staticClass:"sg-page-content"},[a("section",{staticClass:"sg-global-content"},[a("div",{staticClass:"container"},[a("div",{staticClass:"row"},[a("user_sidebar",{attrs:{current:t.current}}),t._v(" "),a("div",{staticClass:"col-lg-9"},[a("div",{staticClass:"sg-table sg-notification"},[a("div",{staticClass:"title justify-content-between"},[t.notifications.total>0?a("h1",[t._v(t._s(t.notifications.total)+" Notifications found")]):t.is_shimmer?a("h1",[t._v(t._s(t.lang.notification_found))]):a("h1",[t._v(t._s(t.lang.loading))]),t._v(" "),t.notifications.total>0?a("a",{attrs:{href:"javascript:void(0)"},on:{click:t.seenAll}},[t._v(t._s(this.lang.seen_all))]):t._e()]),t._v(" "),t.is_shimmer?a("table",{staticClass:"table"},[a("thead",[a("tr",[a("td",[t._v("#")]),t._v(" "),a("td",[t._v(t._s(t.lang.Title))]),t._v(" "),a("td",[t._v(t._s(t.lang.time))]),t._v(" "),a("td",[t._v(t._s(t.lang.action))])])]),t._v(" "),a("tbody",t._l(t.notifications.data,(function(s,e){return a("tr",{key:e},[a("th",{attrs:{scope:"row"}},[t._v(t._s(++e))]),t._v(" "),"unseen"==s.status?a("td",{attrs:{scope:"row"}},[a("div",{staticClass:"product"},[a("a",{attrs:{href:t.getUrl(s.url)}},[a("div",{staticClass:"text"},[a("p",[t._v(t._s(s.title))])])])])]):a("td",[t._v(t._s(s.title))]),t._v(" "),a("td",[t._v(t._s(s.date)+" | "+t._s(s.time))]),t._v(" "),a("td",[a("div",{staticClass:"add-to-cart mb-2 mt-2"},["unseen"==s.status?a("a",{staticClass:"btn",attrs:{href:"javascript:void(0)"},on:{click:function(a){return t.seen(s.id,e-1)}}},[t._v(t._s(t.lang.seen))]):t._e(),t._v(" "),a("a",{staticClass:"btn",attrs:{href:"javascript:void(0)"},on:{click:function(a){return t.remove(s.id,e-1)}}},[t._v(t._s(t.lang.remove))])])])])})),0)]):t.shimmer?a("table",{staticClass:"table"},t._l(8,(function(t,s){return a("shimmer",{key:s,staticClass:"mb-3",attrs:{height:70}})})),1):t._e(),t._v(" "),t.notifications.next_page_url&&!t.loading?a("div",{staticClass:"show-more-button"},[a("a",{staticClass:"btn btn-primary",attrs:{href:"javascript:void(0)"}},[t._v(t._s(t.lang.show_more))])]):t._e(),t._v(" "),t.loading?a("div",{staticClass:"show-more-button"},[a("loading_button",{attrs:{class_name:"btn btn-primary"}})],1):t._e()])])],1)])])])}),[],!1,null,null,null);const o=n.exports},4016:(t,a,s)=>{s.d(a,{Z:()=>r});const e={name:"shimmer.vue",props:["height"],data:function(){return{style:{height:this.height+"px"}}}};const r=(0,s(1900).Z)(e,(function(){var t=this;return(0,t._self._c)("img",{staticClass:"shimmer",style:[t.height?t.style:null],attrs:{src:t.getUrl("public/images/default/preview.jpg"),alt:"shimmer"}})}),[],!1,null,null,null).exports},5888:(t,a,s)=>{s.d(a,{Z:()=>r});const e={name:"user_sidebar",props:["current","addresses"],data:function(){return{loading:!1,download_url:!1,show_menu:""}},mounted:function(){this.checkAuth()},computed:{totalReward:function(){return this.$store.getters.getTotalReward},modalType:function(){return this.$store.getters.getModalType}},components:{shimmer:s(4016).Z},methods:{checkAuth:function(){var t=this,a=this.getUrl("home/check-auth");axios.get(a).then((function(a){t.$store.dispatch("user",a.data.user),t.$store.commit("getOrderUrl",a.data.order_urls),t.authUser?"admin"==t.authUser.user_type&&t.$router.push({name:"home"}):t.$router.push({name:"login"}),a.data.reward&&t.$store.commit("setTotalReward",a.data.reward),a.data.download_urls&&(t.download_url=!0)}))},convertReward:function(){var t=this,a=this.getUrl("user/convert-reward"),s={amount:this.converted_reward/this.settings.reward_convert_rate,reward:this.converted_reward};s.amount>0&&this.totalReward.rewards>=this.converted_reward&&confirm("Are You Sure! You want to Convert ?")&&(this.loading=!0,axios.post(a,s).then((function(a){t.loading=!1,a.data.error?toastr.error(a.data.error,t.lang.Error+" !!"):(toastr.success(a.data.success,t.lang.Success+"!!"),$("#convert_reward").modal("hide"),t.converted_reward="",t.$store.dispatch("user",a.data.user),t.$store.commit("setTotalReward",a.data.reward))})).catch((function(a){t.loading=!1})))},showMenu:function(){"displayMenu"==this.show_menu?this.show_menu="":this.show_menu="displayMenu"}}};const r=(0,s(1900).Z)(e,(function(){var t=this,a=t._self._c;return t.authUser?a("div",{staticClass:"col-lg-3"},[a("div",{staticClass:"profile-details position-relative"},[a("div",{staticClass:"profile-thumb"},[a("img",{staticClass:"img-fluid",attrs:{src:t.authUser.profile_image,alt:t.authUser.full_name}})]),t._v(" "),a("h2",[t._v(t._s(t.authUser.full_name)+" "),a("router-link",{staticClass:"d-inline",attrs:{to:{name:"edit.profile"}}},[a("span",{staticClass:"mdi mdi-name mdi-pencil"})])],1),t._v(" "),a("a",{attrs:{href:"javascript:void(0)"}},[t._v(t._s(t.authUser.email))]),t._v(" "),t.addons.includes("ramdhani")||1!=t.settings.seller_system?t._e():a("router-link",{staticClass:"be_seller base",attrs:{to:{name:"migrate.seller"}}},[t._v("\n                "+t._s(t.lang.be_a_seller)+" "),a("span",{staticClass:"mdi mdi-name mdi-store-outline"})])],1),t._v(" "),a("div",{staticClass:"sidebar-menu"},[a("ul",{staticClass:"global-list"},[a("li",{class:{active:"dashboard"===t.current}},[a("router-link",{attrs:{to:{name:"dashboard"}}},[a("span",{staticClass:"mdi mdi-name mdi-view-dashboard-outline"}),t._v(" "+t._s(t.lang.dashboard)+"\n                    ")])],1),t._v(" "),a("li",{class:{active:"addresses"===t.current}},[a("router-link",{attrs:{to:{name:"addresses"}}},[a("span",{staticClass:"mdi mdi-name mdi-map-marker-outline"}),t._v("\n                        "+t._s(t.lang.addresses)+"\n                    ")])],1),t._v(" "),a("li",{class:{active:"notification"===t.current}},[a("router-link",{attrs:{to:{name:"notification"}}},[a("span",{staticClass:"mdi mdi-name mdi-bell-outline"}),t._v("\n                        "+t._s(t.lang.notification)+"\n                    ")])],1),t._v(" "),a("li",{class:{active:"order_history"===t.current}},[a("router-link",{attrs:{to:{name:"order.history"}}},[a("span",{staticClass:"mdi mdi-name mdi-cart-outline"}),t._v("\n                        "+t._s(t.lang.order_history)+"\n                    ")])],1),t._v(" "),t.download_url?a("li",{class:{active:"digital_product_order_history"===t.current}},[a("router-link",{attrs:{to:{name:"orders.digital.product"}}},[a("span",{staticClass:"mdi mdi-name mdi-cart-arrow-down"}),t._v(" "+t._s(t.lang.digital_product_order)+"\n                    ")])],1):t._e(),t._v(" "),1==t.settings.coupon_system?a("li",{class:{active:"gift_voucher"===t.current}},[a("router-link",{attrs:{to:{name:"gift.voucher"}}},[a("span",{staticClass:"mdi mdi-name mdi-wallet-giftcard"}),t._v("\n                        "+t._s(t.lang.gift_voucher)+"\n                    ")])],1):t._e(),t._v(" "),a("li",{class:{active:"change_password"===t.current}},[a("router-link",{attrs:{to:{name:"change.password"}}},[a("span",{staticClass:"mdi mdi-name mdi-lock-outline"}),t._v("\n                        "+t._s(t.lang.change_password)+"\n                    ")])],1),t._v(" "),1==t.settings.wallet_system?a("li",{class:{active:"wallet_history"===t.current}},[a("router-link",{attrs:{to:{name:"wallet.history"}}},[a("span",{staticClass:"mdi mdi-wallet-outline"}),t._v("\n                        "+t._s(t.lang.my_wallet)+"\n                    ")])],1):t._e(),t._v(" "),t.addons.includes("reward")?a("li",{class:{active:"reward_history"===t.current}},[a("router-link",{attrs:{to:{name:"reward.history"}}},[a("span",{staticClass:"mdi mdi-vector-point"}),t._v(t._s(t.lang.my_rewards)+"\n                    ")])],1):t._e(),t._v(" "),t.addons.includes("affiliate")&&t.authUser.referral_code?a("li",{staticClass:"dp-arrow",class:{active:"affiliate_system"===t.current,displayMenu:"displayMenu"===t.show_menu},on:{click:t.showMenu}},[t._m(0),t._v(" "),a("ul",{staticClass:"dashboard-dp-menu"},[a("li",[a("router-link",{attrs:{to:{name:"affiliate.system"}}},[t._v("Affiliate System")])],1),t._v(" "),a("li",[a("router-link",{attrs:{to:"/sdfsfd"}},[t._v("iewww1")])],1)])]):t._e(),t._v(" "),1==t.settings.seller_system?a("li",{class:{active:"followed_shop"===t.current}},[a("router-link",{attrs:{to:{name:"shop.followed"}}},[a("span",{staticClass:"mdi mdi-home-heart"}),t._v(t._s(t.lang.shop)+"\n                    ")])],1):t._e()])]),t._v(" "),a("div",{staticClass:"modal fade reward",attrs:{id:"convert_reward",tabindex:"-1","aria-labelledby":"exampleModalLabel","aria-hidden":"true"}},[a("div",{staticClass:"modal-dialog modal-md modal-dialog-centered modal-dialog-scrollable"},[a("div",{staticClass:"modal-content"},[a("div",{staticClass:"modal-header"},[a("h5",{staticClass:"modal-title"},[t._v(t._s(t.lang.reward_point))]),t._v(" "),t._m(1)]),t._v(" "),a("div",{staticClass:"modal-body reward_modal"},[a("form",{on:{submit:function(a){return a.preventDefault(),t.convertReward.apply(null,arguments)}}},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-lg-12 text-center"},[a("div",{staticClass:"form-group"},[a("label",{attrs:{for:"reward"}},[t._v(t._s(t.lang.reward_point)+" ")]),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.converted_reward,expression:"converted_reward"}],staticClass:"form-control",attrs:{type:"text",id:"reward",placeholder:t.lang.enter_point_you_want_convert},domProps:{value:t.converted_reward},on:{input:function(a){a.target.composing||(t.converted_reward=a.target.value)}}})]),t._v(" "),null!=t.totalReward?a("div",{staticClass:"text-start"},[a("p",[t._v("Available Points to Convert : "+t._s(t.totalReward.rewards))]),t._v(" "),a("p",[t._v(t._s(t.settings.reward_convert_rate)+t._s(t.lang.reward_points)+t._s(t.priceFormat(1)))]),t._v(" "),t.totalReward.rewards>0?a("p",[t._v(t._s(t.lang.total_amount_you_will_get)+"\n                                            "+t._s(t.priceFormat(t.converted_reward/t.settings.reward_convert_rate)))]):t._e()]):t._e(),t._v(" "),t.loading?a("loading_button",{attrs:{class_name:"btn btn-primary mt-3"}}):a("button",{staticClass:"btn btn-primary mt-3",class:{disable_btn:t.converted_reward<t.settings.reward_convert_rate||t.totalReward.rewards<t.converted_reward},attrs:{type:"submit"}},[t._v("\n                                        "+t._s(t.lang.covert_rewards)+"\n                                    ")])],1)])])])])])])]):t._e()}),[function(){var t=this._self._c;return t("a",{attrs:{href:"javascript:void(0)"}},[t("span",{staticClass:"mdi mdi-vector-point"}),this._v("Affiliate\n                ")])},function(){var t=this._self._c;return t("button",{staticClass:"close modal_close",attrs:{type:"button","data-bs-dismiss":"modal","aria-label":"Close"}},[t("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])}],!1,null,null,null).exports}}]);