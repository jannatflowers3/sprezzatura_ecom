"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_components_frontend_pages_brands_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js":
/*!***************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js ***!
  \***************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../partials/shimmer */ "./resources/js/components/frontend/partials/shimmer.vue");

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "brands",
  data: function data() {
    return {
      loading: false,
      next_page_url: false,
      is_shimmer: false
    };
  },
  components: {
    shimmer: _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  mounted: function mounted() {
    if (this.lengthCounter(this.brands) == 0) {
      this.loadBrands();
    }
    if (this.lengthCounter(this.brands) > 0) {
      this.is_shimmer = true;
    }
  },
  computed: {
    brands: function brands() {
      return this.$store.getters.getAllBrands;
    },
    shimmer: function shimmer() {
      return this.$store.state.module.shimmer;
    },
    paginate: function paginate() {
      return this.$store.state.module.brand_paginate_url;
    }
  },
  methods: {
    loadBrands: function loadBrands() {
      var _this = this;
      var url = this.url + '/home/brands?page=' + this.$store.state.module.brand_paginate_page;
      if (this.$store.state.module.brand_paginate_page != 1) {
        this.loading = true;
      }
      this.$Progress.start();
      axios.get(url).then(function (response) {
        _this.is_shimmer = true;
        if (response.data.error) {
          _this.$Progress.fail();
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          if (_this.$store.state.module.brand_paginate_page != 1) {
            _this.loading = false;
          }
          _this.$store.commit('getAllBrands', response.data.brands);
          _this.$Progress.finish();
        }
      })["catch"](function (error) {
        _this.loading = false;
        _this.is_shimmer = true;
        _this.$Progress.fail();
        if (error.response && error.response.status == 422) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
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

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce":
/*!**************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce ***!
  \**************************************************************************************************************************************************************************************************************************************************************************************************/
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
    staticClass: "brand-section"
  }, [_c("div", {
    staticClass: "container"
  }, [_c("div", {
    staticClass: "title justify-content-between"
  }, [_vm.is_shimmer ? _c("h1", [_vm._v(_vm._s(_vm.lengthCounter(_vm.brands) > 0 ? _vm.lang.brands : _vm.lang.no_brands_found))]) : _c("h1", [_vm._v(_vm._s(_vm.lang.content_loading))])]), _vm._v(" "), _vm.is_shimmer ? _c("div", {
    staticClass: "row"
  }, _vm._l(_vm.brands, function (brand, index) {
    return _c("div", {
      key: index,
      staticClass: "col-6 col-sm-4 col-md-3 col-lg-2"
    }, [_c("div", {
      staticClass: "brand"
    }, [_c("div", {
      staticClass: "brand_image"
    }, [_c("a", {
      attrs: {
        href: _vm.getUrl("brand/" + brand.slug)
      },
      on: {
        click: function click($event) {
          $event.preventDefault();
          return _vm.routerNavigator("product.by.brand", brand.slug);
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        loading: "lazy",
        src: brand.image_130x93,
        alt: brand.title
      }
    })])]), _vm._v(" "), _c("span", {
      staticClass: "brand_title"
    }, [_vm._v(_vm._s(brand.title))])])]);
  }), 0) : _vm.shimmer ? _c("div", {
    staticClass: "row"
  }, _vm._l(12, function (attr, i) {
    return _c("div", {
      staticClass: "col-6 col-sm-4 col-md-3 col-lg-2"
    }, [_c("shimmer", {
      staticClass: "mb-3",
      attrs: {
        height: 155
      }
    })], 1);
  }), 0) : _vm._e(), _vm._v(" "), _vm.paginate && !_vm.loading ? _c("div", {
    staticClass: "col-md-12 text-center show-more"
  }, [_c("a", {
    staticClass: "btn btn-primary",
    attrs: {
      href: "javascript:void(0)"
    },
    on: {
      click: function click($event) {
        return _vm.loadBrands();
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.show_more))])]) : _vm._e(), _vm._v(" "), _c("div", {
    directives: [{
      name: "show",
      rawName: "v-show",
      value: _vm.loading,
      expression: "loading"
    }],
    staticClass: "col-md-12 text-center show-more"
  }, [_c("loading_button", {
    attrs: {
      class_name: "btn btn-primary"
    }
  })], 1)])]);
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

/***/ "./resources/js/components/frontend/pages/brands.vue":
/*!***********************************************************!*\
  !*** ./resources/js/components/frontend/pages/brands.vue ***!
  \***********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./brands.vue?vue&type=template&id=366a8fce */ "./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce");
/* harmony import */ var _brands_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./brands.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _brands_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__.render,
  _brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/brands.vue"
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

/***/ "./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js":
/*!***********************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js ***!
  \***********************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_brands_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./brands.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_brands_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

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

/***/ "./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce":
/*!*****************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce ***!
  \*****************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_brands_vue_vue_type_template_id_366a8fce__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./brands.vue?vue&type=template&id=366a8fce */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/brands.vue?vue&type=template&id=366a8fce");


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