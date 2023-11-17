"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_components_frontend_pages_addons_video_shop_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js":
/*!**************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js ***!
  \**************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../../partials/shimmer */ "./resources/js/components/frontend/partials/shimmer.vue");

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "video_shop",
  data: function data() {
    return {
      page: 1,
      loading: false,
      next_page_url: false,
      is_shimmer: false
    };
  },
  components: {
    shimmer: _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  computed: {
    videoShops: function videoShops() {
      return this.$store.getters.getVideoShops;
    }
  },
  mounted: function mounted() {
    if (this.videoShops.length == 0) {
      this.getVideos();
    } else {
      this.is_shimmer = true;
    }
  },
  methods: {
    getVideos: function getVideos() {
      var _this = this;
      if (this.page > 1) {
        this.loading = true;
      } else {
        this.$Progress.start();
      }
      var url = this.getUrl('get/video-shops?page=' + this.page);
      axios.get(url).then(function (response) {
        _this.is_shimmer = true;
        if (_this.page > 1) {
          _this.loading = false;
        }
        if (response.data.error) {
          if (_this.page == 1) {
            _this.$Progress.fail();
          }
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          if (_this.page == 1) {
            _this.$Progress.finish();
          }
          _this.$store.commit('setVideoShops', response.data.videos.data);
          _this.next_page_url = response.data.videos.next_page_url;
          _this.page++;
        }
      })["catch"](function (error) {
        _this.is_shimmer = true;
        if (_this.page > 1) {
          _this.loading = false;
        } else {
          _this.$Progress.fail();
        }
        if (error.response) {
          toastr.error(error.response.statusText, _this.lang.Error + ' !!');
        } else {
          toastr.error('Something Went Wrong', _this.lang.Error + ' !!');
        }
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js":
/*!*******************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js ***!
  \*******************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "shimmer.vue",
  props: ['height'],
  data: function data() {
    return {
      style: {
        height: this.height + 'px'
      }
    };
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true":
/*!*************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true ***!
  \*************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("section", {
    staticClass: "video-section"
  }, [_c("div", {
    staticClass: "container"
  }, [_c("div", {
    staticClass: "title justify-content-between"
  }, [_c("h1", [_vm._v(_vm._s(_vm.lang.video_shopping))])]), _vm._v(" "), _vm.is_shimmer ? _c("div", {
    staticClass: "row"
  }, [_vm._l(_vm.videoShops, function (video, index) {
    return _c("div", {
      key: index,
      staticClass: "col-lg-3 col-md-4 col-sm-6 mb-3"
    }, [_c("div", {
      staticClass: "video--thumb"
    }, [_c("div", {
      staticClass: "video-play--thumb"
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "video.shopping.details",
          params: {
            slug: video.slug
          }
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        src: video.thumbnail,
        alt: video.title
      }
    })])], 1), _vm._v(" "), _c("div", {
      staticClass: "video--details"
    }, [video.is_live ? _c("span", {
      staticClass: "base"
    }, [_vm._v(_vm._s(_vm.lang.live))]) : _vm._e(), _vm._v(" "), _c("p", {
      staticClass: "video-title"
    }, [_vm._v(_vm._s(video.title))]), _vm._v(" "), _c("router-link", {
      staticClass: "playIcon",
      attrs: {
        to: {
          name: "video.shopping.details",
          params: {
            slug: video.slug
          }
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-name mdi-play"
    })])], 1)])]);
  }), _vm._v(" "), _c("div", {
    staticClass: "show-more mt-4"
  }, [_vm.next_page_url && !_vm.loading ? _c("a", {
    staticClass: "btn",
    attrs: {
      href: "javascript:void(0)"
    },
    on: {
      click: _vm.getVideos
    }
  }, [_vm._v(_vm._s(_vm.lang.show_more))]) : _vm._e(), _vm._v(" "), _vm.loading ? _c("loading_button", {
    attrs: {
      class_name: "btn btn-primary"
    }
  }) : _vm._e()], 1)], 2) : _vm.shimmer ? _c("div", {
    staticClass: "row"
  }, _vm._l(4, function (video, index) {
    return _c("div", {
      key: index,
      staticClass: "col-lg-3 col-md-4 col-sm-6 mb-3"
    }, [_c("div", {
      staticClass: "video--thumb"
    }, [_c("div", {
      staticClass: "video-play--thumb"
    }, [_c("shimmer", {
      attrs: {
        height: 536
      }
    })], 1)])]);
  }), 0) : _vm._e()])]);
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926":
/*!******************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926 ***!
  \******************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("img", {
    staticClass: "shimmer",
    style: [_vm.height ? _vm.style : null],
    attrs: {
      src: _vm.getUrl("public/images/default/preview.jpg"),
      alt: "shimmer"
    }
  });
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./resources/js/components/frontend/pages/addons/video_shop.vue":
/*!**********************************************************************!*\
  !*** ./resources/js/components/frontend/pages/addons/video_shop.vue ***!
  \**********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./video_shop.vue?vue&type=template&id=38785f4e&scoped=true */ "./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true");
/* harmony import */ var _video_shop_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./video_shop.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _video_shop_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__.render,
  _video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  "38785f4e",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/addons/video_shop.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue":
/*!***************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./shimmer.vue?vue&type=template&id=44ada926 */ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926");
/* harmony import */ var _shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./shimmer.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.render,
  _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/partials/shimmer.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js":
/*!**********************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js ***!
  \**********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_video_shop_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./video_shop.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_video_shop_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js":
/*!***************************************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js ***!
  \***************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./shimmer.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true":
/*!****************************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true ***!
  \****************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_video_shop_vue_vue_type_template_id_38785f4e_scoped_true__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./video_shop.vue?vue&type=template&id=38785f4e&scoped=true */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/addons/video_shop.vue?vue&type=template&id=38785f4e&scoped=true");


/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926":
/*!*********************************************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926 ***!
  \*********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./shimmer.vue?vue&type=template&id=44ada926 */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926");


/***/ })

}]);