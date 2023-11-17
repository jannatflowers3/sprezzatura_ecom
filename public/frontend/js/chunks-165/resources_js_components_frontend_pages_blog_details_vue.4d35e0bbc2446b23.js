"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_components_frontend_pages_blog_details_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js":
/*!*********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js ***!
  \*********************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _blog_partials_blog_comments__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./blog_partials/blog_comments */ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue");
/* harmony import */ var _partials_shimmer__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../partials/shimmer */ "./resources/js/components/frontend/partials/shimmer.vue");


/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "blog_details",
  components: {
    blog_comments: _blog_partials_blog_comments__WEBPACK_IMPORTED_MODULE_0__["default"],
    shimmer: _partials_shimmer__WEBPACK_IMPORTED_MODULE_1__["default"]
  },
  data: function data() {
    return {
      collapeActive: 'categories',
      commentForm: {
        comment: '',
        blog_id: '',
        slug: this.$route.params.slug
      },
      page: 1,
      category: true,
      recentPost: true,
      loading: false,
      share_dropdown: false
    };
  },
  mounted: function mounted() {
    this.$store.dispatch('blogDetails', this.$route.params.slug);
  },
  computed: {
    blogDetails: function blogDetails() {
      return this.$store.getters.getBlogDetails;
    },
    categories: function categories() {
      return this.$store.getters.getBlogCategories;
    },
    tags: function tags() {
      return this.$store.getters.getBlogTags;
    },
    recent_posts: function recent_posts() {
      return this.$store.getters.getRecentPosts;
    },
    comments: function comments() {
      return this.$store.getters.getBlogComments;
    },
    shimmer: function shimmer() {
      return this.$store.state.module.shimmer;
    }
  },
  watch: {
    $route: function $route(to, from) {
      this.$store.dispatch('blogDetails', this.$route.params.slug);
    }
  },
  methods: {
    collapeActiveStatus: function collapeActiveStatus(data) {
      if (this.collapeActive == data) {
        this.collapeActive = '';
      } else {
        this.collapeActive = data;
      }
    },
    comment: function comment() {
      var _this = this;
      this.loading = true;
      this.commentForm.blog_id = this.blogDetails.id;
      var url = this.getUrl('store/blog-comment');
      this.$Progress.start();
      axios.post(url, this.commentForm).then(function (response) {
        _this.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          _this.commentForm.comment = '';
          _this.$store.dispatch('blogDetails', _this.$route.params.slug);
          if (response.data.success) {
            toastr.success(response.data.success, _this.lang.Success + ' !!');
          }
          _this.$Progress.finish();
        }
      })["catch"](function (error) {
        _this.loading = false;
      });
    },
    loadCategories: function loadCategories() {
      var _this2 = this;
      this.page++;
      var url = this.url + '/load/blog-categories?page=' + this.page;
      this.$Progress.start();
      axios.get(url).then(function (response) {
        if (response.data.error) {
          toastr.error(response.data.error, _this2.lang.Error + ' !!');
        } else {
          var categories = response.data.categories.data;
          if (categories.length > 0) {
            for (var i in categories) {
              _this2.categories.data.push(categories[i]);
            }
          }
          _this2.$Progress.finish();
          _this2.categories.next_page_url = response.data.categories.next_page_url;
        }
      });
    },
    shareDropdown: function shareDropdown() {
      var _this3 = this;
      this.share_dropdown = !this.share_dropdown;
      this.share_dropdown && this.$nextTick(function () {
        document.addEventListener('click', _this3.hideLanguageDropdown);
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js":
/*!************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js ***!
  \************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _blog_reply__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./blog_reply */ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue");

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "blog_comments",
  components: {
    blog_reply: _blog_reply__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  props: ['comments', 'blogDetails'],
  data: function data() {
    return {
      comment_reply: '',
      page: 1,
      show_replies: '',
      loading: false,
      replyForm: {
        comment: '',
        blog_comment_id: '',
        parent_id: '',
        level: 0,
        slug: this.$route.params.slug
      }
    };
  },
  methods: {
    commentReply: function commentReply(id, parent_id, level) {
      var _this = this;
      this.loading = true;
      this.replyForm.blog_comment_id = id;
      if (parent_id) {
        this.replyForm.parent_id = parent_id;
      }
      if (level || level == 0) {
        this.replyForm.level = level + 1;
      }
      var url = this.getUrl('store/blog-comment-reply');
      axios.post(url, this.replyForm).then(function (response) {
        _this.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          _this.replyForm.comment = '';
          _this.$store.dispatch('blogDetails', _this.$route.params.slug);
          _this.comment_reply = '';
          if (response.data.success) {
            toastr.success(response.data.success, _this.lang.Success + ' !!');
          }
        }
      })["catch"](function (error) {
        _this.loading = false;
      });
    },
    loadMoreComments: function loadMoreComments() {
      var _this2 = this;
      this.page++;
      var url = this.getUrl('load/blog-comments/' + this.blogDetails.id + '?page=' + this.page);
      axios.get(url).then(function (response) {
        if (response.data.error) {
          toastr.error(response.data.error, _this2.lang.Error + ' !!');
        } else {
          var comments = response.data.comments.data;
          if (comments.length > 0) {
            for (var i = 0; i < comments.length; i++) {
              _this2.comments.data.push(comments[i]);
            }
          }
        }
        _this2.comments.next_page_url = response.data.comments.next_page_url;
      });
    },
    showReplyArea: function showReplyArea(id) {
      if (this.show_replies == id) {
        this.show_replies = '';
      } else {
        this.show_replies = id;
      }
    },
    commentLike: function commentLike(id) {
      var _this3 = this;
      var data = {
        paginate: this.page,
        id: id,
        blog_id: this.blogDetails.id
      };
      this.blog_like_loading = true;
      var url = this.getUrl('blog/like-comments');
      axios.post(url, data).then(function (response) {
        _this3.blog_like_loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this3.lang.Error + ' !!');
        } else {
          _this3.comments.data = response.data.comments.data;
          _this3.comments.next_page_url = response.data.comments.next_page_url;
          _this3.comments.total = response.data.comments.total;
          if (response.data.success) {
            toastr.success(response.data.success, _this3.lang.Success + ' !!');
          }
        }
      })["catch"](function (error) {
        _this3.blog_like_loading = false;
      });
    },
    unLike: function unLike(id) {
      var _this4 = this;
      var data = {
        paginate: this.page,
        id: id,
        blog_id: this.blogDetails.id
      };
      this.blog_like_loading = true;
      var url = this.getUrl('blog/unlike-comments');
      axios.post(url, data).then(function (response) {
        _this4.blog_like_loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this4.lang.Error + ' !!');
        } else {
          _this4.comments.data = response.data.comments.data;
          _this4.comments.next_page_url = response.data.comments.next_page_url;
          _this4.comments.total = response.data.comments.total;
          if (response.data.success) {
            toastr.success(response.data.success, _this4.lang.Success + ' !!');
          }
        }
      })["catch"](function (error) {
        _this4.blog_like_loading = false;
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js":
/*!*********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js ***!
  \*********************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _nested_reply__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./nested_reply */ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue");

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "blog_reply",
  components: {
    nested_reply: _nested_reply__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  props: ['comment', 'blogDetails', 'page'],
  computed: {
    replyFormId: function replyFormId() {
      return this.$store.getters.getReplyForm;
    }
  },
  data: function data() {
    return {
      loading: false,
      replyForm: {
        comment: '',
        blog_comment_id: '',
        parent_id: '',
        level: 0,
        slug: this.$route.params.slug
      }
    };
  },
  methods: {
    commentReply: function commentReply(id, parent_id, level) {
      var _this = this;
      this.loading = true;
      this.replyForm.blog_comment_id = id;
      if (parent_id) {
        // this.replyForm.parent_id = parent_id;
        this.replyForm.blog_comment_id = id;
        this.replyForm.level = 0;
      }
      // if (level || level == 0) {
      //     this.replyForm.level = level + 1;
      // }
      var url = this.getUrl('store/blog-comment-reply');
      axios.post(url, this.replyForm).then(function (response) {
        _this.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          _this.replyForm.comment = '';
          _this.$store.dispatch('blogDetails', _this.$route.params.slug);
          _this.$store.dispatch('replyForm', '');
          if (response.data.success) {
            toastr.success(response.data.success, _this.lang.Success + ' !!');
          }
        }
      })["catch"](function (error) {
        _this.loading = false;
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js":
/*!***********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js ***!
  \***********************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "nested_reply",
  props: ['reply', 'comment', 'reply_reply_area'],
  data: function data() {
    return {
      loading: false,
      replyForm: {
        comment: '',
        blog_comment_id: '',
        parent_id: '',
        level: 0,
        slug: this.$route.params.slug
      }
    };
  },
  components: {},
  computed: {
    replyFormId: function replyFormId() {
      return this.$store.getters.getReplyForm;
    }
  },
  methods: {
    commentReply: function commentReply(id, parent_id, level) {
      var _this = this;
      this.loading = true;
      this.replyForm.blog_comment_id = id;
      if (parent_id) {
        this.replyForm.parent_id = parent_id;
      }
      if (level || level == 0) {
        this.replyForm.level = level + 1;
      }
      var url = this.getUrl('store/blog-comment-reply');
      axios.post(url, this.replyForm).then(function (response) {
        _this.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        } else {
          _this.replyForm.comment = '';
          _this.$store.dispatch('blogDetails', _this.$route.params.slug);
          _this.$store.dispatch('replyForm', '');
          if (response.data.success) {
            toastr.success(response.data.success, _this.lang.Success + ' !!');
          }
        }
      })["catch"](function (error) {
        _this.loading = false;
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

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c":
/*!********************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("div", {
    staticClass: "sg-page-content"
  }, [_c("section", {
    staticClass: "grid-view-tab"
  }, [_c("div", {
    staticClass: "container"
  }, [_c("div", {
    staticClass: "row"
  }, [_vm.lengthCounter(_vm.blogDetails) > 0 ? _c("div", {
    staticClass: "col-md-4 col-lg-3"
  }, [_c("div", {
    staticClass: "sg-sitebar new-shop-sitebar"
  }, [_c("div", {
    staticClass: "accordion",
    attrs: {
      id: "accordionExample"
    }
  }, [_c("div", {
    staticClass: "accordion-item"
  }, [_c("div", {
    staticClass: "accordion-header",
    attrs: {
      id: "ac1"
    }
  }, [_c("button", {
    staticClass: "accordion-button",
    "class": {
      collapsed: !_vm.category
    },
    attrs: {
      type: "button",
      "data-bs-toggle": "collapse",
      "data-bs-target": "#collapse1",
      "aria-expanded": "true",
      "aria-controls": "collapse1"
    },
    on: {
      click: function click($event) {
        _vm.category = !_vm.category;
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.all_categories) + "\n                                    ")])]), _vm._v(" "), _c("div", {
    staticClass: "accordion-collapse collapse",
    "class": {
      show: _vm.category
    },
    attrs: {
      id: "collapse1",
      "aria-labelledby": "ac1",
      "data-bs-parent": "#accordionExample"
    }
  }, [_c("div", {
    staticClass: "accordion-body"
  }, [_c("ul", {
    staticClass: "global-list"
  }, [_vm._l(_vm.categories.data, function (category, index) {
    return _c("li", {
      key: index
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "category.blogs",
          params: {
            slug: category.slug
          }
        }
      }
    }, [_vm._v("\n                                                    " + _vm._s(category.title) + "\n                                                ")])], 1);
  }), _vm._v(" "), _vm.categories.next_page_url ? _c("li", [_c("a", {
    attrs: {
      href: "javascript:void(0)"
    },
    on: {
      click: _vm.loadCategories
    }
  }, [_vm._v(_vm._s(_vm.lang.show_more))])]) : _vm._e()], 2)])])]), _vm._v(" "), _c("div", {
    staticClass: "accordion-item"
  }, [_c("div", {
    staticClass: "accordion-header",
    attrs: {
      id: "ac2"
    }
  }, [_c("button", {
    staticClass: "accordion-button",
    "class": {
      collapsed: !_vm.recentPost
    },
    attrs: {
      type: "button",
      "data-bs-toggle": "collapse",
      "data-bs-target": "#collapse2",
      "aria-expanded": "false",
      "aria-controls": "collapse2"
    },
    on: {
      click: function click($event) {
        _vm.recentPost = !_vm.recentPost;
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.recent_post) + "\n                                    ")])]), _vm._v(" "), _c("div", {
    staticClass: "accordion-collapse collapse",
    "class": {
      show: _vm.recentPost
    },
    attrs: {
      id: "collapse2",
      "aria-labelledby": "ac2",
      "data-bs-parent": "#accordionExample"
    }
  }, [_c("div", {
    staticClass: "accordion-body"
  }, [_c("div", {
    staticClass: "widget widget_recent_entries"
  }, [_c("ul", {
    staticClass: "global-list"
  }, _vm._l(_vm.recent_posts.data, function (blog, index) {
    return _c("li", {
      key: "post" + index,
      staticClass: "media"
    }, [_c("div", {
      staticClass: "entry-thumbnail"
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "blog.details",
          params: {
            blogId: blog.id,
            slug: blog.slug
          }
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        loading: "lazy",
        src: blog.recent_post_image,
        alt: blog.title
      }
    })])], 1), _vm._v(" "), _c("div", {
      staticClass: "media-body"
    }, [_c("h5", [_c("router-link", {
      attrs: {
        to: {
          name: "blog.details",
          params: {
            blogId: blog.id,
            slug: blog.slug
          }
        }
      }
    }, [_vm._v("\n                                                                " + _vm._s(blog.title) + "\n                                                            ")])], 1), _vm._v(" "), _c("span", {
      staticClass: "post-date"
    }, [_vm._v(_vm._s(blog.published_date))])])]);
  }), 0), _vm._v(" "), _vm.recent_posts.next_page_url ? _c("div", [_c("router-link", {
    attrs: {
      to: {
        name: "blogs"
      },
      href: "javascript:void(0)"
    }
  }, [_vm._v(_vm._s(_vm.lang.show_more) + "\n                                                ")])], 1) : _vm._e()])])])]), _vm._v(" "), _vm.tags[1] != null ? _c("div", {
    staticClass: "accordion-item"
  }, [_c("div", {
    staticClass: "accordion-header",
    attrs: {
      id: "ac3"
    }
  }, [_c("button", {
    staticClass: "accordion-button",
    "class": {
      collapsed: _vm.collapeActive != "tags"
    },
    attrs: {
      type: "button",
      "data-bs-toggle": "collapse",
      "data-bs-target": "#collapse3",
      "aria-expanded": "false",
      "aria-controls": "collapse3"
    },
    on: {
      click: function click($event) {
        return _vm.collapeActiveStatus("tags");
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.tags) + "\n                                    ")])]), _vm._v(" "), _c("div", {
    staticClass: "accordion-collapse collapse",
    "class": {
      show: _vm.collapeActive == "tags"
    },
    attrs: {
      id: "collapse3",
      "aria-labelledby": "ac3",
      "data-bs-parent": "#accordionExample"
    }
  }, [_c("div", {
    staticClass: "accordion-body"
  }, [_c("div", {
    staticClass: "tagcloud"
  }, _vm._l(_vm.tags, function (tag, i) {
    return _c("a", {
      key: i,
      attrs: {
        href: "javascript:void(0)"
      }
    }, [_vm._v(_vm._s(tag))]);
  }), 0)])])]) : _vm._e()])])]) : _vm.shimmer ? _c("div", {
    staticClass: "col-md-4 col-lg-3"
  }, [_c("shimmer", {
    attrs: {
      height: 600
    }
  })], 1) : _vm._e(), _vm._v(" "), _c("div", {
    staticClass: "col-md-8 col-lg-9"
  }, [_c("div", {
    staticClass: "blog-details"
  }, [_c("div", {
    staticClass: "post"
  }, [_c("div", {
    staticClass: "entry-header"
  }, [_c("div", {
    staticClass: "entry-thumbnail"
  }, [_c("a", [_vm.blogDetails.banner_img ? _c("img", {
    staticClass: "img-fluid",
    attrs: {
      loading: "lazy",
      src: _vm.blogDetails.banner_img,
      alt: _vm.blogDetails.title
    }
  }) : _vm.shimmer ? _c("shimmer", {
    attrs: {
      height: 200
    }
  }) : _vm._e()], 1)])]), _vm._v(" "), _c("div", {
    staticClass: "entry-content"
  }, [_c("div", {
    staticClass: "entry-meta"
  }, [_vm.lengthCounter(_vm.blogDetails) > 0 ? _c("ul", {
    staticClass: "global-list"
  }, [_vm.blogDetails.user ? _c("li", [_c("a", {
    attrs: {
      href: "javascript:void(0)"
    }
  }, [_vm.blogDetails.user.user_profile_image ? _c("img", {
    staticClass: "img-fluid",
    attrs: {
      loading: "lazy",
      src: _vm.blogDetails.user.user_profile_image,
      alt: _vm.blogDetails.user.full_name
    }
  }) : _vm._e(), _vm._v(_vm._s(_vm.blogDetails.user.full_name))])]) : _vm._e(), _vm._v(" "), _c("li", [_c("a", {
    attrs: {
      href: "javascript:void(0)"
    }
  }, [_c("span", {
    staticClass: "mdi mdi-calendar-month"
  }), _vm._v(_vm._s(_vm.blogDetails.published_date))])]), _vm._v(" "), _c("li", [_c("a", {
    attrs: {
      href: "#"
    }
  }, [_c("span", {
    staticClass: "mdi mdi-eye-outline"
  }), _vm._v(_vm._s(_vm.blogDetails.blog_views_count) + " " + _vm._s(_vm.lang.view))])]), _vm._v(" "), _c("li", [_c("a", {
    attrs: {
      href: "#"
    }
  }, [_c("span", {
    staticClass: "mdi mdi-message-text-outline"
  }), _vm._v(_vm._s(_vm.comments.total) + " " + _vm._s(_vm.lang.comment))])]), _vm._v(" "), _c("li", [_c("div", {
    staticClass: "dropdown"
  }, [_c("button", {
    staticClass: "btn btn-secondary share_dropdown",
    "class": {
      show: _vm.share_dropdown
    },
    attrs: {
      type: "button",
      id: "dropdownMenuButton",
      "data-toggle": "dropdown",
      "aria-haspopup": "true",
      "aria-expanded": "false"
    },
    on: {
      click: function click($event) {
        $event.stopPropagation();
        return _vm.shareDropdown.apply(null, arguments);
      }
    }
  }, [_c("span", {
    staticClass: "mdi mdi-share-variant"
  }), _vm._v(_vm._s(_vm.lang.share) + "\n                                                ")]), _vm._v(" "), _c("div", {
    staticClass: "dropdown-menu",
    "class": {
      show: _vm.share_dropdown
    },
    attrs: {
      "aria-labelledby": "dropdownMenuButton"
    },
    on: {
      click: function click($event) {
        _vm.share_dropdown = false;
      }
    }
  }, [_c("a", {
    staticClass: "dropdown-item",
    attrs: {
      target: "_blank",
      href: "https://www.facebook.com/sharer/sharer.php?u=" + _vm.getUrl("blog/" + _vm.blogDetails.slug)
    }
  }, [_vm._v(_vm._s(_vm.lang.facebook))]), _vm._v(" "), _c("a", {
    staticClass: "dropdown-item",
    attrs: {
      target: "_blank",
      href: "https://twitter.com/intent/tweet?text=" + _vm.blogDetails.title + "&url=" + _vm.getUrl("blog/" + _vm.blogDetails.slug)
    }
  }, [_vm._v(_vm._s(_vm.lang.twitter))]), _vm._v(" "), _c("a", {
    staticClass: "dropdown-item",
    attrs: {
      target: "_blank",
      href: "https://www.linkedin.com/sharing/share-offsite?mini=true&url=" + _vm.getUrl("blog/" + _vm.blogDetails.slug) + "&title=" + _vm.blogDetails.title + "&summary=Extra+linkedin+summary+can+be+passed+here"
    }
  }, [_vm._v(_vm._s(_vm.lang.linkedin))]), _vm._v(" "), _c("a", {
    staticClass: "dropdown-item",
    attrs: {
      target: "_blank",
      href: "https://wa.me/?text=" + _vm.getUrl("blog/" + _vm.blogDetails.slug)
    }
  }, [_vm._v(_vm._s(_vm.lang.whatsapp))])])])])]) : _vm.shimmer ? _c("ul", {
    staticClass: "global-list"
  }, [_c("shimmer", {
    attrs: {
      height: 10
    }
  })], 1) : _vm._e()]), _vm._v(" "), _vm.lengthCounter(_vm.blogDetails) > 0 ? _c("div", [_c("h1", {
    staticClass: "entry-title"
  }, [_vm._v(_vm._s(_vm.blogDetails.title))]), _vm._v(" "), _c("div", {
    domProps: {
      innerHTML: _vm._s(_vm.blogDetails.description)
    }
  })]) : _vm.shimmer ? _c("div", [_c("shimmer", {
    attrs: {
      height: 30
    }
  })], 1) : _vm._e()])]), _vm._v(" "), _c("div", {
    staticClass: "comment-area"
  }, [_vm.lengthCounter(_vm.blogDetails) > 0 ? _c("h3", {
    staticClass: "title-style-1 mt-5"
  }, [_vm._v(_vm._s(_vm.comments.total) + " " + _vm._s(_vm.lang.comments))]) : _vm.shimmer ? _c("h3", {
    staticClass: "title-style-1 mt-5"
  }, [_c("shimmer", {
    attrs: {
      height: 20
    }
  })], 1) : _vm._e(), _vm._v(" "), _c("blog_comments", {
    attrs: {
      comments: _vm.comments,
      "blog-details": _vm.blogDetails
    }
  })], 1), _vm._v(" "), _vm.lengthCounter(_vm.blogDetails) > 0 ? _c("div", [_vm.authUser ? _c("div", {
    staticClass: "comment-form"
  }, [_c("h3", {
    staticClass: "title-style-1"
  }, [_vm._v(_vm._s(_vm.lang.write_a_comments))]), _vm._v(" "), _c("form", {
    staticClass: "tr-form",
    on: {
      submit: function submit($event) {
        $event.preventDefault();
        return _vm.comment.apply(null, arguments);
      }
    }
  }, [_c("div", {
    staticClass: "form-group"
  }, [_c("textarea", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.commentForm.comment,
      expression: "commentForm.comment"
    }],
    staticClass: "form-control",
    attrs: {
      required: "required",
      rows: "8",
      placeholder: "Write Comment"
    },
    domProps: {
      value: _vm.commentForm.comment
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.commentForm, "comment", $event.target.value);
      }
    }
  })]), _vm._v(" "), _vm.loading ? _c("loading_button", {
    attrs: {
      class_name: "btn btn-primary"
    }
  }) : _c("input", {
    staticClass: "btn btn-primary",
    attrs: {
      type: "submit"
    },
    domProps: {
      value: _vm.lang.post
    }
  })], 1)]) : _vm._e()]) : _vm.shimmer ? _c("div", {
    staticClass: "comment-form"
  }, [_c("shimmer", {
    attrs: {
      height: 200
    }
  })], 1) : _vm._e()])])])])])]);
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274":
/*!***********************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274 ***!
  \***********************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _vm.comments.data ? _c("ul", {
    staticClass: "comment-list global-list"
  }, [_vm._l(_vm.comments.data, function (comment, index) {
    return _c("li", {
      key: index
    }, [_c("div", {
      staticClass: "comment_info"
    }, [comment.user ? _c("div", {
      staticClass: "commenter-avatar"
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "profile"
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        src: comment.user.profile_image,
        alt: comment.user.full_name
      }
    })])], 1) : _vm._e(), _vm._v(" "), comment.user ? _c("div", {
      staticClass: "comment-box"
    }, [_c("div", {
      staticClass: "comment-title"
    }, [_c("span", {
      staticClass: "title-1"
    }, [_c("router-link", {
      staticClass: "url",
      attrs: {
        to: {
          name: "profile"
        }
      }
    }, [_vm._v(_vm._s(comment.user.full_name))])], 1), _vm._v(" "), _c("div", {
      staticClass: "comment-meta"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_c("li", [_c("router-link", {
      attrs: {
        to: {
          name: "dashboard"
        }
      }
    }, [_vm._v("\n                                    " + _vm._s(comment.comment_date) + "\n                                ")])], 1)])])])]) : _vm._e(), _vm._v(" "), _c("p", [_vm._v(_vm._s(comment.comment))]), _vm._v(" "), _vm.comment_reply == comment.id ? _c("form", {
      staticClass: "tr-form mb-4",
      on: {
        submit: function submit($event) {
          $event.preventDefault();
          return _vm.commentReply(comment.id);
        }
      }
    }, [_c("div", {
      staticClass: "row"
    }, [_c("div", {
      staticClass: "col-10"
    }, [_c("div", {
      staticClass: "form-group"
    }, [_c("textarea", {
      directives: [{
        name: "model",
        rawName: "v-model",
        value: _vm.replyForm.comment,
        expression: "replyForm.comment"
      }],
      staticClass: "form-control reply_box",
      attrs: {
        required: "required",
        rows: "2",
        placeholder: _vm.lang.write_reply
      },
      domProps: {
        value: _vm.replyForm.comment
      },
      on: {
        input: function input($event) {
          if ($event.target.composing) return;
          _vm.$set(_vm.replyForm, "comment", $event.target.value);
        }
      }
    })])]), _vm._v(" "), _c("div", {
      staticClass: "col-2"
    }, [_vm.loading ? _c("loading_button", {
      attrs: {
        class_name: "btn btn-sm btn-primary"
      }
    }) : _c("input", {
      staticClass: "btn btn-primary",
      attrs: {
        type: "submit"
      },
      domProps: {
        value: _vm.lang.post
      }
    })], 1)])]) : _vm._e(), _vm._v(" "), _c("div", {
      staticClass: "comment-icon"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_vm.alreadyLiked(comment.comment_likes) ? _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javascript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.unLike(comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(comment.comment_likes.length) + ")")])])]) : _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javascript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.commentLike(comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up-outline"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(comment.comment_likes.length) + ")")])])]), _vm._v(" "), _c("li", [_c("a", {
      attrs: {
        href: "javascript:void(0)"
      },
      on: {
        click: function click($event) {
          _vm.comment_reply = comment.id;
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-share"
    })])]), _vm._v(" "), comment.comment_replies.length > 0 ? _c("li", [_c("a", {
      attrs: {
        href: "javascript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.showReplyArea(comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "replies_text"
    }, [_vm._v(_vm._s(comment.comment_replies.length) + " " + _vm._s(_vm.lang.replies))])])]) : _vm._e()])]), _vm._v(" "), _c("blog_reply", {
      directives: [{
        name: "show",
        rawName: "v-show",
        value: _vm.show_replies == comment.id,
        expression: "show_replies == comment.id"
      }],
      attrs: {
        comment: comment,
        "blog-details": _vm.blogDetails,
        page: _vm.page
      }
    })], 1)]);
  }), _vm._v(" "), _vm.comments.next_page_url ? _c("li", [_c("div", {
    staticClass: "text-center show-more"
  }, [_vm.loading ? _c("loading_button", {
    attrs: {
      class_name: "btn btn-primary"
    }
  }) : _c("a", {
    staticClass: "btn btn-primary",
    attrs: {
      href: "javascript:void(0)"
    },
    on: {
      click: function click($event) {
        return _vm.loadMoreComments();
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.show_more))])], 1)]) : _vm._e()], 2) : _vm._e();
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a":
/*!********************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a ***!
  \********************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("ul", {
    staticClass: "children global-list"
  }, _vm._l(_vm.comment.comment_replies, function (reply, index) {
    return _c("li", {
      key: "reply" + index
    }, [_c("div", {
      staticClass: "comment_info"
    }, [reply.user ? _c("div", {
      staticClass: "commenter-avatar"
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "dashboard"
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        src: reply.user.profile_image,
        alt: reply.user.full_name
      }
    })])], 1) : _vm._e(), _vm._v(" "), reply.user ? _c("div", {
      staticClass: "comment-box"
    }, [_c("div", {
      staticClass: "comment-title"
    }, [_c("span", {
      staticClass: "title-1"
    }, [_c("router-link", {
      staticClass: "url",
      attrs: {
        to: {
          name: "dashboard"
        }
      }
    }, [_vm._v(_vm._s(reply.user.full_name))])], 1), _vm._v(" "), _c("div", {
      staticClass: "comment-meta"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_c("li", [_c("router-link", {
      attrs: {
        to: {
          name: "profile"
        }
      }
    }, [_vm._v("\n                                        " + _vm._s(reply.reply_date) + "\n                                    ")])], 1)])])])]) : _vm._e(), _vm._v(" "), _c("p", [_vm._v(_vm._s(reply.comment))]), _vm._v(" "), _vm.replyFormId == reply.id ? _c("form", {
      staticClass: "tr-form",
      on: {
        submit: function submit($event) {
          $event.preventDefault();
          return _vm.commentReply(_vm.comment.id, reply.id, reply.level);
        }
      }
    }, [_c("div", {
      staticClass: "row"
    }, [_c("div", {
      staticClass: "col-10"
    }, [_c("div", {
      staticClass: "form-group"
    }, [_c("textarea", {
      directives: [{
        name: "model",
        rawName: "v-model",
        value: _vm.replyForm.comment,
        expression: "replyForm.comment"
      }],
      staticClass: "form-control reply_box",
      attrs: {
        required: "required",
        rows: "2",
        placeholder: _vm.lang.write_reply
      },
      domProps: {
        value: _vm.replyForm.comment
      },
      on: {
        input: function input($event) {
          if ($event.target.composing) return;
          _vm.$set(_vm.replyForm, "comment", $event.target.value);
        }
      }
    })])]), _vm._v(" "), _c("div", {
      staticClass: "col-2"
    }, [_vm.loading ? _c("loading_button", {
      attrs: {
        class_name: "btn btn-primary"
      }
    }) : _c("input", {
      staticClass: "btn btn-primary",
      attrs: {
        type: "submit"
      },
      domProps: {
        value: _vm.lang.post
      }
    })], 1)])]) : _vm._e(), _vm._v(" "), _c("div", {
      staticClass: "comment-icon"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_vm.alreadyLiked(reply.comment_likes) ? _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.unLike(reply.id, _vm.comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(reply.comment_likes.length) + ")")])])]) : _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.likeReply(reply.id, _vm.comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up-outline"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(reply.comment_likes.length) + ")")])])]), _vm._v(" "), _c("li", [_c("a", {
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.$store.dispatch("replyForm", reply.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-share"
    })])])])])])]);
  }), 0);
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122":
/*!**********************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122 ***!
  \**********************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _vm.reply.replies ? _c("ul", {
    staticClass: "children global-list"
  }, _vm._l(_vm.reply.replies, function (reply_reply, index) {
    return _c("li", {
      key: "nested_reply" + index
    }, [_c("div", {
      staticClass: "comment_info"
    }, [reply_reply.user ? _c("div", {
      staticClass: "commenter-avatar"
    }, [_c("router-link", {
      attrs: {
        to: {
          name: "dashboard"
        }
      }
    }, [_c("img", {
      staticClass: "img-fluid",
      attrs: {
        src: reply_reply.user.profile_image,
        alt: reply_reply.user.full_name
      }
    })])], 1) : _vm._e(), _vm._v(" "), reply_reply.user ? _c("div", {
      staticClass: "comment-box"
    }, [_c("div", {
      staticClass: "comment-title"
    }, [_c("span", {
      staticClass: "title-1"
    }, [_c("router-link", {
      staticClass: "url",
      attrs: {
        to: {
          name: "dashboard"
        }
      }
    }, [_vm._v(_vm._s(reply_reply.user.full_name))])], 1), _vm._v(" "), _c("div", {
      staticClass: "comment-meta"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_c("li", [_c("router-link", {
      attrs: {
        to: {
          name: "profile"
        }
      }
    }, [_vm._v("\n                                    " + _vm._s(reply_reply.reply_date) + "\n                                ")])], 1)])])])]) : _vm._e(), _vm._v(" "), _c("p", [_vm._v(_vm._s(reply_reply.comment))]), _vm._v(" "), _vm.replyFormId == reply_reply.id ? _c("form", {
      staticClass: "tr-form",
      on: {
        submit: function submit($event) {
          $event.preventDefault();
          return _vm.commentReply(_vm.comment.id, reply_reply.id, reply_reply.level);
        }
      }
    }, [_c("div", {
      staticClass: "row"
    }, [_c("div", {
      staticClass: "col-10"
    }, [_c("div", {
      staticClass: "form-group"
    }, [_c("textarea", {
      directives: [{
        name: "model",
        rawName: "v-model",
        value: _vm.replyForm.comment,
        expression: "replyForm.comment"
      }],
      staticClass: "form-control reply_box",
      attrs: {
        required: "required",
        rows: "2",
        placeholder: _vm.lang.write_reply
      },
      domProps: {
        value: _vm.replyForm.comment
      },
      on: {
        input: function input($event) {
          if ($event.target.composing) return;
          _vm.$set(_vm.replyForm, "comment", $event.target.value);
        }
      }
    })])]), _vm._v(" "), _c("div", {
      staticClass: "col-2"
    }, [_vm.loading ? _c("loading_button", {
      attrs: {
        class_name: "btn btn-primary"
      }
    }) : _c("input", {
      staticClass: "btn btn-primary",
      attrs: {
        type: "submit"
      },
      domProps: {
        value: _vm.lang.post
      }
    })], 1)])]) : _vm._e(), _vm._v(" "), _c("div", {
      staticClass: "comment-icon"
    }, [_c("ul", {
      staticClass: "global-list"
    }, [_vm.alreadyLiked(reply_reply.comment_likes) ? _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.unLike(reply_reply.id, _vm.comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(reply_reply.comment_likes.length) + ")")])])]) : _c("li", [_c("a", {
      "class": {
        disable_btn: _vm.blog_like_loading
      },
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.likeReply(reply_reply.id, _vm.comment.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-thumb-up-outline"
    }), _vm._v(" "), _c("span", {
      staticClass: "replies_text"
    }, [_vm._v("(" + _vm._s(reply_reply.comment_likes.length) + ")")])])]), _vm._v(" "), _c("li", [_c("a", {
      attrs: {
        href: "javaScript:void(0)"
      },
      on: {
        click: function click($event) {
          return _vm.$store.dispatch("replyForm", reply_reply.id);
        }
      }
    }, [_c("span", {
      staticClass: "mdi mdi-share"
    })])])])]), _vm._v(" "), _c("nested_reply", {
      attrs: {
        reply: reply_reply,
        comment: _vm.comment
      }
    })], 1)]);
  }), 0) : _vm._e();
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

/***/ "./resources/js/components/frontend/pages/blog_details.vue":
/*!*****************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_details.vue ***!
  \*****************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./blog_details.vue?vue&type=template&id=2848ae9c */ "./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c");
/* harmony import */ var _blog_details_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./blog_details.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _blog_details_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__.render,
  _blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/blog_details.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue":
/*!********************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_comments.vue ***!
  \********************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./blog_comments.vue?vue&type=template&id=65237274 */ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274");
/* harmony import */ var _blog_comments_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./blog_comments.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _blog_comments_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__.render,
  _blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/blog_partials/blog_comments.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue":
/*!*****************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_reply.vue ***!
  \*****************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./blog_reply.vue?vue&type=template&id=0dd40d9a */ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a");
/* harmony import */ var _blog_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./blog_reply.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _blog_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__.render,
  _blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/blog_partials/blog_reply.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue":
/*!*******************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/nested_reply.vue ***!
  \*******************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./nested_reply.vue?vue&type=template&id=4bea6122 */ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122");
/* harmony import */ var _nested_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./nested_reply.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _nested_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__.render,
  _nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/blog_partials/nested_reply.vue"
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

/***/ "./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js":
/*!*****************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js ***!
  \*****************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_details_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_details.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_details_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js":
/*!********************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js ***!
  \********************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_comments_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_comments.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_comments_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js":
/*!*****************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js ***!
  \*****************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_reply.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js":
/*!*******************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js ***!
  \*******************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_nested_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./nested_reply.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_nested_reply_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

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

/***/ "./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c":
/*!***********************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c ***!
  \***********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_details_vue_vue_type_template_id_2848ae9c__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_details.vue?vue&type=template&id=2848ae9c */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_details.vue?vue&type=template&id=2848ae9c");


/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274":
/*!**************************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274 ***!
  \**************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_comments_vue_vue_type_template_id_65237274__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_comments.vue?vue&type=template&id=65237274 */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_comments.vue?vue&type=template&id=65237274");


/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a":
/*!***********************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a ***!
  \***********************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_blog_reply_vue_vue_type_template_id_0dd40d9a__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./blog_reply.vue?vue&type=template&id=0dd40d9a */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/blog_reply.vue?vue&type=template&id=0dd40d9a");


/***/ }),

/***/ "./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122":
/*!*************************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122 ***!
  \*************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_nested_reply_vue_vue_type_template_id_4bea6122__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./nested_reply.vue?vue&type=template&id=4bea6122 */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/blog_partials/nested_reply.vue?vue&type=template&id=4bea6122");


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