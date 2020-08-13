webpackJsonp([1],[,,,,,,,,,,,,,function(e,t,n){"use strict";(function(e){var r=n(6),u=n(1),i=n(22);r.a.use(u.a);var c={menuStack:new Array,help:null,currentMenu:i.a.currentMenu()},s={TOGGLE_MENU:function(e,t){e.currentMenu.opened=t},SET_MENU:function(e,t){e.currentMenu=i.a.currentMenu(),e.currentMenu.title=t.title,e.currentMenu.subtitle=t.subtitle,e.currentMenu.limit=t.limit,e.currentMenu.slider=t.slider,e.currentMenu.grid=t.grid,e.currentMenu.style=t.style,e.currentMenu.onItemChange=t.onItemChange,e.currentMenu.index=t.index,t.items.forEach(function(e,n){n>t.limit-1?e.visible=!1:e.visible=!0,a.commit("ADD_ITEM",e)}),null!==t.stats?t.stats.forEach(function(e){a.commit("ADD_STATS",e)}):e.currentMenu.stats=null,null!==t.colorPicker&&(e.currentMenu.colorPicker={name:t.colorPicker.name,colors:t.colorPicker.colors,index:t.colorPicker.index||0,onChange:t.colorPicker.onChange}),e.menuStack.push(e.currentMenu)},ADD_ITEM:function(e,t){e.currentMenu.items.push({visible:t.visible,index:t.index||0,style:t.style||null,value:t.value||null,key:t.key||null,help:t.help||null,submenu:t.submenu||null,action:t.action||null,onChange:t.onChange||null,back:t.back||null})},ADD_STATS:function(e,t){e.currentMenu.Stats.push(t)},RESET_STATS:function(e,t){e.currentMenu.Stats=[]},RETURN_BACK:function(e){e.menuStack.length>1&&(e.menuStack.pop(),e.currentMenu=e.menuStack[e.menuStack.length-1])},NEXT_MENU_INDEX:function(e){e.currentMenu.index=e.currentMenu.index+1},PREV_MENU_INDEX:function(e){e.currentMenu.index=e.currentMenu.index-1},PREV_ITEM_INDEX:function(e){e.currentMenu.items[e.currentMenu.index].index=e.currentMenu.items[e.currentMenu.index].index-1,e.currentMenu.items[e.currentMenu.index].index<0&&(e.currentMenu.items[e.currentMenu.index].index=e.currentMenu.items[e.currentMenu.index].value.length-1)},NEXT_ITEM_INDEX:function(e){e.currentMenu.items[e.currentMenu.index].index=e.currentMenu.items[e.currentMenu.index].index+1,e.currentMenu.items[e.currentMenu.index].index>e.currentMenu.items[e.currentMenu.index].value.length-1&&(e.currentMenu.items[e.currentMenu.index].index=0)},PREV_COLORPICKER_INDEX:function(e){e.currentMenu.colorPicker.index=e.currentMenu.colorPicker.index-1,e.currentMenu.colorPicker.index<0&&(e.currentMenu.colorPicker.index=e.currentMenu.colorPicker.colors.length-1)},NEXT_COLORPICKER_INDEX:function(e){e.currentMenu.colorPicker.index=e.currentMenu.colorPicker.index+1,e.currentMenu.colorPicker.index>e.currentMenu.colorPicker.colors.length-1&&(e.currentMenu.colorPicker.index=0)}},l={getCurrentMenu:function(e){return e.currentMenu},currentItem:function(e){return e.currentMenu.items[e.currentMenu.index]},menu:function(e){return e.currentMenu},menuStack:function(e){return e.menuStack},help:function(e){return e.help},getStats:function(e){return e.currentMenu.Stats}},o={processClick:function(e){e.state.currentMenu.items[e.state.currentMenu.index].back?!0===e.state.currentMenu.items[e.state.currentMenu.index].back&&e.commit("RETURN_BACK",{}):null!==e.state.currentMenu.items[e.state.currentMenu.index].action&&"function"==typeof e.state.currentMenu.items[e.state.currentMenu.index].action&&e.state.currentMenu.items[e.state.currentMenu.index].action()},returnBack:function(e){e.commit("RETURN_BACK",{})},prevIndex:function(e){e.commit("PREV_MENU_INDEX",{})},nextIndex:function(e){e.commit("NEXT_MENU_INDEX",{})},prevSelectionItem:function(e){e.commit("PREV_ITEM_INDEX",{}),c.currentMenu.items[c.currentMenu.index].onChange(c.currentMenu.items[c.currentMenu.index].index)},nextSelectionItem:function(e){e.commit("NEXT_ITEM_INDEX",{}),c.currentMenu.items[c.currentMenu.index].onChange(c.currentMenu.items[c.currentMenu.index].index)},prevColorItem:function(e){e.commit("PREV_COLORPICKER_INDEX",{}),e.state.currentMenu.colorPicker.onChange(c.currentMenu.colorPicker.colors[c.currentMenu.colorPicker.index])},nextColorItem:function(e){e.commit("NEXT_COLORPICKER_INDEX",{}),e.state.currentMenu.colorPicker.onChange(c.currentMenu.colorPicker.colors[c.currentMenu.colorPicker.index])}},a=new u.a.Store({state:c,mutations:s,getters:l,actions:o});e.store=a,t.a=a}).call(t,n(12))},function(e,t,n){function r(e){n(52)}var u=n(0)(n(15),n(63),r,null,null);e.exports=u.exports},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=n(60),u=n.n(r);t.default={name:"app",components:{PopupMenu:u.a}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={props:{name:String,colors:Array,index:{type:Number,default:0}},methods:{isShowing:function(e){if(this.index>7){if(e<this.index-7)return!1;if(e>this.index)return!1}else if(e>7)return!1;return!0}}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={props:{x:Number,y:Number,left:{type:String,default:"Left"},right:{type:String,default:"Right"},top:{type:String,default:"Top"},bottom:{type:String,default:"Bottom"}},computed:{realX:function(){return 130*this.x},realY:function(){return 130*this.y}}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=n(24),u=n.n(r),i=n(1),c=n(61),s=n.n(c),l=n(58),o=n.n(l),a=n(59),d=n.n(a),m=n(62),M=n.n(m);t.default={components:{Selection:s.a,ColorSelector:o.a,Grid:d.a,Stage:M.a},props:{},computed:u()({},n.i(i.b)({currentMenu:"getCurrentMenu",currentItem:"currentItem",menu:"menu",menuStack:"menuStack",help:"help"})),methods:u()({},n.i(i.c)({processClick:"processClick",returnBack:"returnBack",prevIndex:"prevIndex",nextIndex:"nextIndex",prevSelectionItem:"prevSelectionItem",nextSelectionItem:"nextSelectionItem",prevColorItem:"prevColorItem",nextColorItem:"nextColorItem"})),mounted:function(){var e=this,t=this.currentMenu.limit>this.currentMenu.items.length?this.currentMenu.items.length:this.currentMenu.limit;if(this.currentMenu.items.length>t)for(var n=t;n<this.currentMenu.items.length;n++)this.currentMenu.items[n].visible=!1;window.addEventListener("wheel",function(t){var n=t.deltaY||t.detail||t.wheelData;n>0?e.currentMenu.index++:n<0&&e.currentMenu.index--}),this.$nextTick(function(){if(0!==this.$vnode.elm.getElementsByClassName("xygrid").length){var t=this.$vnode.elm.getElementsByClassName("xygrid")[0].children[1],n=!1;t.addEventListener("mousedown",function(t){if(1===t.which){var r=getElementPosition(t.currentTarget),u=t.clientX-r.x,i=t.clientY-r.y;e.currentMenu.grid&&u<136&&i<136&&e.currentMenu.setGridXY(u/130,i/130),n=!0}}),window.addEventListener("mouseup",function(e){1===e.which&&(n=!1)}),t.addEventListener("mousemove",function(t){if(n){var r=getElementPosition(t.currentTarget),u=t.clientX-r.x,i=t.clientY-r.y;e.currentMenu.grid&&u<136&&i<136&&e.currentMenu.setGridXY(u/130,i/130)}})}}),window.addEventListener("keydown",function(t){return console.log(t.keyCode),38==t.keyCode?e.prevIndex():40==t.keyCode?e.nextIndex():13==t.keyCode?e.processClick(e.currentMenu.index):8==t.keyCode&&e.returnBack(),null!=e.currentItem&&(37==t.keyCode?e.prevSelectionItem():39==t.keyCode&&e.nextSelectionItem()),e.currentMenu.colorPicker&&(37==t.keyCode?e.prevColorItem():39==t.keyCode&&e.nextColorItem()),!1})},watch:{"currentMenu.index":function(e,t){if(e>this.currentMenu.items.length-1){for(var n=0;n<this.currentMenu.items.length;n++)n>=this.currentMenu.limit?this.currentMenu.items[n].visible=!1:this.currentMenu.items[n].visible=!0;return void(this.currentMenu.index=0)}if(e<0){for(var n=0;n<this.currentMenu.items.length;n++)this.currentMenu.items.length-n>this.currentMenu.limit?this.currentMenu.items[n].visible=!1:this.currentMenu.items[n].visible=!0;return void(this.currentMenu.index=this.currentMenu.items.length-1)}"function"==typeof this.currentMenu.onItemChange&&this.currentMenu.onItemChange(this.currentMenu.index),e>this.currentMenu.limit-1?this.currentMenu.items[e-this.currentMenu.limit].visible=!1:this.currentMenu.items.length-e>this.currentMenu.limit&&(this.currentMenu.items[e+this.currentMenu.limit].visible=!1),this.currentMenu.items[e].visible=!0,this.currentMenu.items[e].help?this.help=this.currentMenu.items[e].help:this.help=null}}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default={name:"selection-item",props:{index:{type:Number,default:0},list:Array}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});n(1);t.default={props:["levels","width","value","units"],computed:{valueCount:function(){return null!=this.value?Math.ceil(this.value/100/(1/this.levels)):0},currentWidth:function(){return this.width}},methods:{computeValueWidth:function(e){if(e==this.valueCount){return(this.value-100/this.levels*(this.valueCount-1))/100*this.width-2}return this.width/this.levels-2}},created:function(){}}},function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=n(6),u=n(1),i=n(14),c=n.n(i),s=n(13);r.a.use(u.a),r.a.config.productionTip=!1,new r.a({el:"#app",store:s.a,template:"<App/>",components:{App:c.a}})},function(e,t,n){"use strict";t.a={currentMenu:function(){return{opened:!0,title:"",subtitle:"&nbsp;",limit:7,items:[],Stats:[],slider:null,colorPicker:null,Grid:null,Style:"blue",onItemChange:null,index:0,back:null}}}},,,,,,,,,,,,,,,,,,,,,,,,,,,,,,function(e,t){},function(e,t){},function(e,t){},function(e,t){},function(e,t){},function(e,t){},function(e,t,n){function r(e){n(56)}var u=n(0)(n(16),n(67),r,null,null);e.exports=u.exports},function(e,t,n){function r(e){n(57)}var u=n(0)(n(17),n(68),r,null,null);e.exports=u.exports},function(e,t,n){function r(e){n(53)}var u=n(0)(n(18),n(64),r,null,null);e.exports=u.exports},function(e,t,n){function r(e){n(54)}var u=n(0)(n(19),n(65),r,null,null);e.exports=u.exports},function(e,t,n){function r(e){n(55)}var u=n(0)(n(20),n(66),r,null,null);e.exports=u.exports},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{attrs:{id:"app"}},[n("popup-menu")],1)},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("transition",{attrs:{name:"slide"}},[e.currentMenu.opened?n("div",{staticClass:"popup-menu"},[n("div",{class:["header",e.currentMenu.style]},[n("h1",{domProps:{innerHTML:e._s(e.currentMenu.title)}}),e._v(" "),n("h3",[n("span",{domProps:{innerHTML:e._s(e.currentMenu.subtitle)}}),e._v(" "),n("span",{staticClass:"right"},[e._v(e._s(e.currentMenu.index+1)+" / "+e._s(e.currentMenu.items.length))])]),e._v(" "),n("div",{staticClass:"clear"})]),e._v(" "),n("ul",e._l(e.currentMenu.items,function(t,r){return t.visible?n("li",{class:[t.style,{active:e.currentMenu.index==r}],on:{click:function(t){e.processClick(e.currentItem,r)}}},["[object Array]"!==Object.prototype.toString.call(t.value)?n("div",[t.value?n("span",{domProps:{innerHTML:e._s(t.key)}}):e._e(),e._v(" "),t.value?n("span",{domProps:{innerHTML:e._s(t.value)}}):n("div",[e._v(e._s(t.key))])]):n("div",[n("span",[e._v(e._s(t.key))]),e._v(" "),n("span",[n("selection",{attrs:{list:t.value,index:t.index}})],1)])]):e._e()})),e._v(" "),e.currentMenu.items.length>e.currentMenu.limit?n("div",{staticClass:"scroll-line"}):e._e(),e._v(" "),e.help?n("div",{staticClass:"help"},[n("p",[e._v(e._s(e.help))])]):e._e(),e._v(" "),e.currentMenu.colorPicker?n("div",[n("color-selector",{attrs:{name:e.currentMenu.colorPicker.name,colors:e.currentMenu.colorPicker.colors,index:e.currentMenu.colorPicker.index}})],1):e._e(),e._v(" "),e.currentMenu.grid?n("div",[n("xygrid",{attrs:{x:e.currentMenu.grid.x,y:e.currentMenu.grid.y,top:e.currentMenu.grid.top,bottom:e.currentMenu.grid.bottom,left:e.currentMenu.grid.left,right:e.currentMenu.grid.right}})],1):e._e(),e._v(" "),e.currentMenu.Stats?n("div",{staticClass:"stats"},e._l(e.currentMenu.Stats,function(t){return n("div",[n("span",[e._v(e._s(t.name))]),e._v(" "),n("stage",{attrs:{levels:t.levels,value:t.value,width:t.width}})],1)})):e._e()]):e._e()])},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"selection"},e._l(e.list,function(t,r){return n("li",{class:{active:e.index===r}},[n("span",{style:t.s1},[e._v(e._s(t.n1))]),e._v(" "),n("span",{style:t.s2},[e._v(e._s(t.n2))]),e._v(" "),n("span",{style:t.s3},[e._v(e._s(t.n3))])])}))},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"stage",style:{width:e.width+"px"}},[e._l(e.levels,function(t){return n("div",{staticClass:"level",style:{width:e.width/e.levels-2+"px"}})}),e._v(" "),e._l(e.valueCount,function(t){return e.value?n("div",{staticClass:"value",style:{width:e.computeValueWidth(t)+"px",left:(t-1)*(e.computeValueWidth(t-1)+2)+"px"}}):e._e()}),e._v(" "),n("div",{staticClass:"clear"})],2)},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"colors"},[n("div",{staticClass:"title"},[e._v("Colors ("+e._s(e.index+1+" / "+e.colors.length)+")")]),e._v(" "),n("ul",e._l(e.colors,function(t,r){return e.isShowing(r)?n("li",{class:{active:e.index===r},style:{background:"#"+t}}):e._e()})),e._v(" "),n("div",{staticClass:"clear"})])},staticRenderFns:[]}},function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"xygrid"},[n("div",{staticClass:"top"},[e._v(e._s(e.top))]),e._v(" "),n("div",{staticClass:"grid"},[n("div",{staticClass:"point",style:{left:e.realX+"px",top:e.realY+"px"}})]),e._v(" "),n("div",{staticClass:"bottom"},[e._v(e._s(e.bottom))]),e._v(" "),n("div",{staticClass:"r"},[n("div",{staticClass:"left"},[e._v(e._s(e.left))])]),e._v(" "),n("div",{staticClass:"l"},[n("div",{staticClass:"right"},[e._v(e._s(e.right))])])])},staticRenderFns:[]}}],[21]);
//# sourceMappingURL=app.js.map