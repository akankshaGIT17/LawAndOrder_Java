

(function(){var _1=null;if((_1||(typeof djConfig!="undefined"&&djConfig.scopeMap))&&(typeof window!="undefined")){var _2="",_3="",_4="",_5={},_6={};_1=_1||djConfig.scopeMap;for(var i=0;i<_1.length;i++){var _7=_1[i];_2+="var "+_7[0]+" = {}; "+_7[1]+" = "+_7[0]+";"+_7[1]+"._scopeName = '"+_7[1]+"';";_3+=(i==0?"":",")+_7[0];_4+=(i==0?"":",")+_7[1];_5[_7[0]]=_7[1];_6[_7[1]]=_7[0];}eval(_2+"dojo._scopeArgs = ["+_4+"];");dojo._scopePrefixArgs=_3;dojo._scopePrefix="(function("+_3+"){";dojo._scopeSuffix="})("+_4+")";dojo._scopeMap=_5;dojo._scopeMapRev=_6;}(function(){if(typeof this["loadFirebugConsole"]=="function"){this["loadFirebugConsole"]();}else{this.console=this.console||{};var cn=["assert","count","debug","dir","dirxml","error","group","groupEnd","info","profile","profileEnd","time","timeEnd","trace","warn","log"];var i=0,tn;while((tn=cn[i++])){if(!console[tn]){(function(){var _8=tn+"";console[_8]=("log" in console)?function(){var a=Array.apply({},arguments);a.unshift(_8+":");console["log"](a.join(" "));}:function(){};console[_8]._fake=true;})();}}}if(typeof dojo=="undefined"){dojo={_scopeName:"dojo",_scopePrefix:"",_scopePrefixArgs:"",_scopeSuffix:"",_scopeMap:{},_scopeMapRev:{}};}var d=dojo;if(typeof dijit=="undefined"){dijit={_scopeName:"dijit"};}if(typeof dojox=="undefined"){dojox={_scopeName:"dojox"};}if(!d._scopeArgs){d._scopeArgs=[dojo,dijit,dojox];}d.global=this;d.config={isDebug:false,debugAtAllCosts:false};if(typeof djConfig!="undefined"){for(var _9 in djConfig){d.config[_9]=djConfig[_9];}}dojo.locale=d.config.locale;var _a="$Rev: 22734 $".match(/\d+/);dojo.version={major:1,minor:5,patch:1,flag:"",revision:_a?+_a[0]:NaN,toString:function(){with(d.version){return major+"."+minor+"."+patch+flag+" ("+revision+")";}}};if(typeof OpenAjax!="undefined"){OpenAjax.hub.registerLibrary(dojo._scopeName,"http://dojotoolkit.org",d.version.toString());}var _b,_c,_d={};for(var i in {toString:1}){_b=[];break;}dojo._extraNames=_b=_b||["hasOwnProperty","valueOf","isPrototypeOf","propertyIsEnumerable","toLocaleString","toString","constructor"];_c=_b.length;dojo._mixin=function(_e,_f){var _10,s,i;for(_10 in _f){s=_f[_10];if(!(_10 in _e)||(_e[_10]!==s&&(!(_10 in _d)||_d[_10]!==s))){_e[_10]=s;}}if(_c&&_f){for(i=0;i<_c;++i){_10=_b[i];s=_f[_10];if(!(_10 in _e)||(_e[_10]!==s&&(!(_10 in _d)||_d[_10]!==s))){_e[_10]=s;}}}return _e;};dojo.mixin=function(obj,_11){if(!obj){obj={};}for(var i=1,l=arguments.length;i<l;i++){d._mixin(obj,arguments[i]);}return obj;};dojo._getProp=function(_12,_13,_14){var obj=_14||d.global;for(var i=0,p;obj&&(p=_12[i]);i++){if(i==0&&d._scopeMap[p]){p=d._scopeMap[p];}obj=(p in obj?obj[p]:(_13?obj[p]={}:undefined));}return obj;};dojo.setObject=function(_15,_16,_17){var _18=_15.split("."),p=_18.pop(),obj=d._getProp(_18,true,_17);return obj&&p?(obj[p]=_16):undefined;};dojo.getObject=function(_19,_1a,_1b){return d._getProp(_19.split("."),_1a,_1b);};dojo.exists=function(_1c,obj){return !!d.getObject(_1c,false,obj);};dojo["eval"]=function(_1d){return d.global.eval?d.global.eval(_1d):eval(_1d);};d.deprecated=d.experimental=function(){};})();(function(){var d=dojo;d.mixin(d,{_loadedModules:{},_inFlightCount:0,_hasResource:{},_modulePrefixes:{dojo:{name:"dojo",value:"."},doh:{name:"doh",value:"../util/doh"},tests:{name:"tests",value:"tests"}},_moduleHasPrefix:function(_1e){var mp=d._modulePrefixes;return !!(mp[_1e]&&mp[_1e].value);},_getModulePrefix:function(_1f){var mp=d._modulePrefixes;if(d._moduleHasPrefix(_1f)){return mp[_1f].value;}return _1f;},_loadedUrls:[],_postLoad:false,_loaders:[],_unloaders:[],_loadNotifying:false});dojo._loadUriAndCheck=function(uri,_20,cb){var ok=false;try{ok=d._loadUri(uri,cb);}catch(e){console.error("failed loading "+uri+" with error: "+e);}return !!(ok&&d._loadedModules[_20]);};dojo.loaded=function(){d._loadNotifying=true;d._postLoad=true;var mll=d._loaders;d._loaders=[];for(var x=0;x<mll.length;x++){mll[x]();}d._loadNotifying=false;if(d._postLoad&&d._inFlightCount==0&&mll.length){d._callLoaded();}};dojo.unloaded=function(){var mll=d._unloaders;while(mll.length){(mll.pop())();}};d._onto=function(arr,obj,fn){if(!fn){arr.push(obj);}else{if(fn){var _21=(typeof fn=="string")?obj[fn]:fn;arr.push(function(){_21.call(obj);});}}};dojo.ready=dojo.addOnLoad=function(obj,_22){d._onto(d._loaders,obj,_22);if(d._postLoad&&d._inFlightCount==0&&!d._loadNotifying){d._callLoaded();}};var dca=d.config.addOnLoad;if(dca){d.addOnLoad[(dca instanceof Array?"apply":"call")](d,dca);}dojo._modulesLoaded=function(){if(d._postLoad){return;}if(d._inFlightCount>0){console.warn("files still in flight!");return;}d._callLoaded();};dojo._callLoaded=function(){if(typeof setTimeout=="object"||(d.config.useXDomain&&d.isOpera)){setTimeout(d.isAIR?function(){d.loaded();}:d._scopeName+".loaded();",0);}else{d.loaded();}};dojo._getModuleSymbols=function(_23){var _24=_23.split(".");for(var i=_24.length;i>0;i--){var _25=_24.slice(0,i).join(".");if(i==1&&!d._moduleHasPrefix(_25)){_24[0]="../"+_24[0];}else{var _26=d._getModulePrefix(_25);if(_26!=_25){_24.splice(0,i,_26);break;}}}return _24;};dojo._global_omit_module_check=false;dojo.loadInit=function(_27){_27();};dojo._loadModule=dojo.require=function(_28,_29){_29=d._global_omit_module_check||_29;var _2a=d._loadedModules[_28];if(_2a){return _2a;}var _2b=d._getModuleSymbols(_28).join("/")+".js";var _2c=!_29?_28:null;var ok=d._loadPath(_2b,_2c);if(!ok&&!_29){throw new Error("Could not load '"+_28+"'; last tried '"+_2b+"'");}if(!_29&&!d._isXDomain){_2a=d._loadedModules[_28];if(!_2a){throw new Error("symbol '"+_28+"' is not defined after loading '"+_2b+"'");}}return _2a;};dojo.provide=function(_2d){_2d=_2d+"";return (d._loadedModules[_2d]=d.getObject(_2d,true));};dojo.platformRequire=function(_2e){var _2f=_2e.common||[];var _30=_2f.concat(_2e[d._name]||_2e["default"]||[]);for(var x=0;x<_30.length;x++){var _31=_30[x];if(_31.constructor==Array){d._loadModule.apply(d,_31);}else{d._loadModule(_31);}}};dojo.requireIf=function(_32,_33){if(_32===true){var _34=[];for(var i=1;i<arguments.length;i++){_34.push(arguments[i]);}d.require.apply(d,_34);}};dojo.requireAfterIf=d.requireIf;dojo.registerModulePath=function(_35,_36){d._modulePrefixes[_35]={name:_35,value:_36};};if(typeof dojo.config["useXDomain"]=="undefined"){dojo.config.useXDomain=true;}dojo.registerModulePath("dojo","http://ajax.googleapis.com/ajax/libs/dojo/1.5.1/dojo");dojo.registerModulePath("dijit","http://ajax.googleapis.com/ajax/libs/dojo/1.5.1/dijit");dojo.registerModulePath("dojox","http://ajax.googleapis.com/ajax/libs/dojo/1.5.1/dojox");dojo.requireLocalization=function(_37,_38,_39,_3a){d.require("dojo.i18n");d.i18n._requireLocalization.apply(d.hostenv,arguments);};var ore=new RegExp("^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?$"),ire=new RegExp("^((([^\\[:]+):)?([^@]+)@)?(\\[([^\\]]+)\\]|([^\\[:]*))(:([0-9]+))?$");dojo._Url=function(){var n=null,_3b=arguments,uri=[_3b[0]];for(var i=1;i<_3b.length;i++){if(!_3b[i]){continue;}var _3c=new d._Url(_3b[i]+""),_3d=new d._Url(uri[0]+"");if(_3c.path==""&&!_3c.scheme&&!_3c.authority&&!_3c.query){if(_3c.fragment!=n){_3d.fragment=_3c.fragment;}_3c=_3d;}else{if(!_3c.scheme){_3c.scheme=_3d.scheme;if(!_3c.authority){_3c.authority=_3d.authority;if(_3c.path.charAt(0)!="/"){var _3e=_3d.path.substring(0,_3d.path.lastIndexOf("/")+1)+_3c.path;var _3f=_3e.split("/");for(var j=0;j<_3f.length;j++){if(_3f[j]=="."){if(j==_3f.length-1){_3f[j]="";}else{_3f.splice(j,1);j--;}}else{if(j>0&&!(j==1&&_3f[0]=="")&&_3f[j]==".."&&_3f[j-1]!=".."){if(j==(_3f.length-1)){_3f.splice(j,1);_3f[j-1]="";}else{_3f.splice(j-1,2);j-=2;}}}}_3c.path=_3f.join("/");}}}}uri=[];if(_3c.scheme){uri.push(_3c.scheme,":");}if(_3c.authority){uri.push("//",_3c.authority);}uri.push(_3c.path);if(_3c.query){uri.push("?",_3c.query);}if(_3c.fragment){uri.push("#",_3c.fragment);}}this.uri=uri.join("");var r=this.uri.match(ore);this.scheme=r[2]||(r[1]?"":n);this.authority=r[4]||(r[3]?"":n);this.path=r[5];this.query=r[7]||(r[6]?"":n);this.fragment=r[9]||(r[8]?"":n);if(this.authority!=n){r=this.authority.match(ire);this.user=r[3]||n;this.password=r[4]||n;this.host=r[6]||r[7];this.port=r[9]||n;}};dojo._Url.prototype.toString=function(){return this.uri;};dojo.moduleUrl=function(_40,url){var loc=d._getModuleSymbols(_40).join("/");if(!loc){return null;}if(loc.lastIndexOf("/")!=loc.length-1){loc+="/";}var _41=loc.indexOf(":");if(loc.charAt(0)!="/"&&(_41==-1||_41>loc.indexOf("/"))){loc=d.baseUrl+loc;}return new d._Url(loc,url);};})();dojo.provide("dojo._base._loader.loader_xd");dojo._xdReset=function(){dojo._isXDomain=dojo.config.useXDomain||false;dojo._xdClearInterval();dojo._xdInFlight={};dojo._xdOrderedReqs=[];dojo._xdDepMap={};dojo._xdContents=[];dojo._xdDefList=[];};dojo._xdClearInterval=function(){if(dojo._xdTimer){clearInterval(dojo._xdTimer);dojo._xdTimer=0;}};dojo._xdReset();dojo._xdCreateResource=function(_42,_43,_44){var _45=_42.replace(/(\/\*([\s\S]*?)\*\/|\/\/(.*)$)/mg,"");var _46=[];var _47=/dojo.(require|requireIf|provide|requireAfterIf|platformRequire|requireLocalization)\s*\(([\w\W]*?)\)/mg;var _48;while((_48=_47.exec(_45))!=null){if(_48[1]=="requireLocalization"){eval(_48[0]);}else{_46.push("\""+_48[1]+"\", "+_48[2]);}}var _49=[];_49.push(dojo._scopeName+"._xdResourceLoaded(function("+dojo._scopePrefixArgs+"){\n");var _4a=dojo._xdExtractLoadInits(_42);if(_4a){_42=_4a[0];for(var i=1;i<_4a.length;i++){_49.push(_4a[i]+";\n");}}_49.push("return {");if(_46.length>0){_49.push("depends: [");for(i=0;i<_46.length;i++){if(i>0){_49.push(",\n");}_49.push("["+_46[i]+"]");}_49.push("],");}_49.push("\ndefineResource: function("+dojo._scopePrefixArgs+"){");if(!dojo.config["debugAtAllCosts"]||_43=="dojo._base._loader.loader_debug"){_49.push(_42);}_49.push("\n}, resourceName: '"+_43+"', resourcePath: '"+_44+"'};});");return _49.join("");};dojo._xdExtractLoadInits=function(_4b){var _4c=/dojo.loadInit\s*\(/g;_4c.lastIndex=0;var _4d=/[\(\)]/g;_4d.lastIndex=0;var _4e=[];var _4f;while((_4f=_4c.exec(_4b))){_4d.lastIndex=_4c.lastIndex;var _50=1;var _51;while((_51=_4d.exec(_4b))){if(_51[0]==")"){_50-=1;}else{_50+=1;}if(_50==0){break;}}if(_50!=0){throw "unmatched paren around character "+_4d.lastIndex+" in: "+_4b;}var _52=_4c.lastIndex-_4f[0].length;_4e.push(_4b.substring(_52,_4d.lastIndex));var _53=_4d.lastIndex-_52;_4b=_4b.substring(0,_52)+_4b.substring(_4d.lastIndex,_4b.length);_4c.lastIndex=_4d.lastIndex-_53;_4c.lastIndex=_4d.lastIndex;}if(_4e.length>0){_4e.unshift(_4b);}return (_4e.length?_4e:null);};dojo._xdIsXDomainPath=function(_54){var _55=_54.indexOf(":");var _56=_54.indexOf("/");if(_55>0&&_55<_56||_54.indexOf("//")===0){return true;}else{var url=dojo.baseUrl;_55=url.indexOf(":");_56=url.indexOf("/");if(url.indexOf("//")===0||(_55>0&&_55<_56&&(!location.host||url.indexOf("http://"+location.host)!=0))){return true;}}return false;};dojo._loadPath=function(_57,_58,cb){var _59=dojo._xdIsXDomainPath(_57);dojo._isXDomain|=_59;var uri=((_57.charAt(0)=="/"||_57.match(/^\w+:/))?"":dojo.baseUrl)+_57;try{return ((!_58||dojo._isXDomain)?dojo._loadUri(uri,cb,_59,_58):dojo._loadUriAndCheck(uri,_58,cb));}catch(e){console.error(e);return false;}};dojo._xdCharSet="utf-8";dojo._loadUri=function(uri,cb,_5a,_5b){if(dojo._loadedUrls[uri]){return 1;}if(dojo._isXDomain&&_5b&&_5b!="dojo.i18n"){dojo._xdOrderedReqs.push(_5b);if(_5a||uri.indexOf("/nls/")==-1){dojo._xdInFlight[_5b]=true;dojo._inFlightCount++;}if(!dojo._xdTimer){if(dojo.isAIR){dojo._xdTimer=setInterval(function(){dojo._xdWatchInFlight();},100);}else{dojo._xdTimer=setInterval(dojo._scopeName+"._xdWatchInFlight();",100);}}dojo._xdStartTime=(new Date()).getTime();}if(_5a){var _5c=uri.lastIndexOf(".");if(_5c<=0){_5c=uri.length-1;}var _5d=uri.substring(0,_5c)+".xd";if(_5c!=uri.length-1){_5d+=uri.substring(_5c,uri.length);}if(dojo.isAIR){_5d=_5d.replace("app:/","/");}var _5e=document.createElement("script");_5e.type="text/javascript";if(dojo._xdCharSet){_5e.charset=dojo._xdCharSet;}_5e.src=_5d;if(!dojo.headElement){dojo._headElement=document.getElementsByTagName("head")[0];if(!dojo._headElement){dojo._headElement=document.getElementsByTagName("html")[0];}}dojo._headElement.appendChild(_5e);}else{var _5f=dojo._getText(uri,null,true);if(_5f==null){return 0;}if(dojo._isXDomain&&uri.indexOf("/nls/")==-1&&_5b!="dojo.i18n"){var res=dojo._xdCreateResource(_5f,_5b,uri);dojo.eval(res);}else{if(cb){_5f="("+_5f+")";}else{_5f=dojo._scopePrefix+_5f+dojo._scopeSuffix;}var _60=dojo["eval"](_5f+"\r\n//@ sourceURL="+uri);if(cb){cb(_60);}}}dojo._loadedUrls[uri]=true;dojo._loadedUrls.push(uri);return true;};dojo._xdResourceLoaded=function(res){res=res.apply(dojo.global,dojo._scopeArgs);var _61=res.depends;var _62=null;var _63=null;var _64=[];if(_61&&_61.length>0){var dep=null;var _65=0;var _66=false;for(var i=0;i<_61.length;i++){dep=_61[i];if(dep[0]=="provide"){_64.push(dep[1]);}else{if(!_62){_62=[];}if(!_63){_63=[];}var _67=dojo._xdUnpackDependency(dep);if(_67.requires){_62=_62.concat(_67.requires);}if(_67.requiresAfter){_63=_63.concat(_67.requiresAfter);}}var _68=dep[0];var _69=_68.split(".");if(_69.length==2){dojo[_69[0]][_69[1]].apply(dojo[_69[0]],dep.slice(1));}else{dojo[_68].apply(dojo,dep.slice(1));}}if(_64.length==1&&_64[0]=="dojo._base._loader.loader_debug"){res.defineResource(dojo);}else{var _6a=dojo._xdContents.push({content:res.defineResource,resourceName:res["resourceName"],resourcePath:res["resourcePath"],isDefined:false})-1;for(i=0;i<_64.length;i++){dojo._xdDepMap[_64[i]]={requires:_62,requiresAfter:_63,contentIndex:_6a};}}for(i=0;i<_64.length;i++){dojo._xdInFlight[_64[i]]=false;}}};dojo._xdLoadFlattenedBundle=function(_6b,_6c,_6d,_6e){_6d=_6d||"root";var _6f=dojo.i18n.normalizeLocale(_6d).replace("-","_");var _70=[_6b,"nls",_6c].join(".");var _71=dojo["provide"](_70);_71[_6f]=_6e;var _72=[_6b,_6f,_6c].join(".");var _73=dojo._xdBundleMap[_72];if(_73){for(var _74 in _73){_71[_74]=_6e;}}};dojo._xdInitExtraLocales=function(){var _75=dojo.config.extraLocale;if(_75){if(!_75 instanceof Array){_75=[_75];}dojo._xdReqLoc=dojo.xdRequireLocalization;dojo.xdRequireLocalization=function(m,b,_76,_77){dojo._xdReqLoc(m,b,_76,_77);if(_76){return;}for(var i=0;i<_75.length;i++){dojo._xdReqLoc(m,b,_75[i],_77);}};}};dojo._xdBundleMap={};dojo.xdRequireLocalization=function(_78,_79,_7a,_7b){if(dojo._xdInitExtraLocales){dojo._xdInitExtraLocales();dojo._xdInitExtraLocales=null;dojo.xdRequireLocalization.apply(dojo,arguments);return;}var _7c=_7b.split(",");var _7d=dojo.i18n.normalizeLocale(_7a);var _7e="";for(var i=0;i<_7c.length;i++){if(_7d.indexOf(_7c[i])==0){if(_7c[i].length>_7e.length){_7e=_7c[i];}}}var _7f=_7e.replace("-","_");var _80=dojo.getObject([_78,"nls",_79].join("."));if(!_80||!_80[_7f]){var _81=[_78,(_7f||"root"),_79].join(".");var _82=dojo._xdBundleMap[_81];if(!_82){_82=dojo._xdBundleMap[_81]={};}_82[_7d.replace("-","_")]=true;dojo.require(_78+".nls"+(_7e?"."+_7e:"")+"."+_79);}};dojo._xdRealRequireLocalization=dojo.requireLocalization;dojo.requireLocalization=function(_83,_84,_85,_86){var _87=dojo.moduleUrl(_83).toString();if(dojo._xdIsXDomainPath(_87)){return dojo.xdRequireLocalization.apply(dojo,arguments);}else{return dojo._xdRealRequireLocalization.apply(dojo,arguments);}};dojo._xdUnpackDependency=function(dep){var _88=null;var _89=null;switch(dep[0]){case "requireIf":case "requireAfterIf":if(dep[1]===true){_88=[{name:dep[2],content:null}];}break;case "platformRequire":var _8a=dep[1];var _8b=_8a["common"]||[];_88=(_8a[dojo.hostenv.name_])?_8b.concat(_8a[dojo.hostenv.name_]||[]):_8b.concat(_8a["default"]||[]);if(_88){for(var i=0;i<_88.length;i++){if(_88[i] instanceof Array){_88[i]={name:_88[i][0],content:null};}else{_88[i]={name:_88[i],content:null};}}}break;case "require":_88=[{name:dep[1],content:null}];break;case "i18n._preloadLocalizations":dojo.i18n._preloadLocalizations.apply(dojo.i18n._preloadLocalizations,dep.slice(1));break;}if(dep[0]=="requireAfterIf"||dep[0]=="requireIf"){_89=_88;_88=null;}return {requires:_88,requiresAfter:_89};};dojo._xdWalkReqs=function(){var _8c=null;var req;for(var i=0;i<dojo._xdOrderedReqs.length;i++){req=dojo._xdOrderedReqs[i];if(dojo._xdDepMap[req]){_8c=[req];_8c[req]=true;dojo._xdEvalReqs(_8c);}}};dojo._xdEvalReqs=function(_8d){while(_8d.length>0){var req=_8d[_8d.length-1];var res=dojo._xdDepMap[req];var i,_8e,_8f;if(res){_8e=res.requires;if(_8e&&_8e.length>0){for(i=0;i<_8e.length;i++){_8f=_8e[i].name;if(_8f&&!_8d[_8f]){_8d.push(_8f);_8d[_8f]=true;dojo._xdEvalReqs(_8d);}}}var _90=dojo._xdContents[res.contentIndex];if(!_90.isDefined){var _91=_90.content;_91["resourceName"]=_90["resourceName"];_91["resourcePath"]=_90["resourcePath"];dojo._xdDefList.push(_91);_90.isDefined=true;}dojo._xdDepMap[req]=null;_8e=res.requiresAfter;if(_8e&&_8e.length>0){for(i=0;i<_8e.length;i++){_8f=_8e[i].name;if(_8f&&!_8d[_8f]){_8d.push(_8f);_8d[_8f]=true;dojo._xdEvalReqs(_8d);}}}}_8d.pop();}};dojo._xdWatchInFlight=function(){var _92="";var _93=(dojo.config.xdWaitSeconds||15)*1000;var _94=(dojo._xdStartTime+_93)<(new Date()).getTime();for(var _95 in dojo._xdInFlight){if(dojo._xdInFlight[_95]===true){if(_94){_92+=_95+" ";}else{return;}}}dojo._xdClearInterval();if(_94){throw "Could not load cross-domain resources: "+_92;}dojo._xdWalkReqs();var _96=dojo._xdDefList.length;for(var i=0;i<_96;i++){var _97=dojo._xdDefList[i];if(dojo.config["debugAtAllCosts"]&&_97["resourceName"]){if(!dojo["_xdDebugQueue"]){dojo._xdDebugQueue=[];}dojo._xdDebugQueue.push({resourceName:_97.resourceName,resourcePath:_97.resourcePath});}else{_97.apply(dojo.global,dojo._scopeArgs);}}for(i=0;i<dojo._xdContents.length;i++){var _98=dojo._xdContents[i];if(_98.content&&!_98.isDefined){_98.content.apply(dojo.global,dojo._scopeArgs);}}dojo._xdReset();if(dojo["_xdDebugQueue"]&&dojo._xdDebugQueue.length>0){dojo._xdDebugFileLoaded();}else{dojo._xdNotifyLoaded();}};dojo._xdNotifyLoaded=function(){for(var _99 in dojo._xdInFlight){if(typeof dojo._xdInFlight[_99]=="boolean"){return;}}dojo._inFlightCount=0;if(dojo._initFired&&!dojo._loadNotifying){dojo._callLoaded();}};if(typeof window!="undefined"){dojo.isBrowser=true;dojo._name="browser";(function(){var d=dojo;if(document&&document.getElementsByTagName){var _9a=document.getElementsByTagName("script");var _9b=/dojo(\.xd)?\.js(\W|$)/i;for(var i=0;i<_9a.length;i++){var src=_9a[i].getAttribute("src");if(!src){continue;}var m=src.match(_9b);if(m){if(!d.config.baseUrl){d.config.baseUrl=src.substring(0,m.index);}var cfg=_9a[i].getAttribute("djConfig");if(cfg){var _9c=eval("({ "+cfg+" })");for(var x in _9c){dojo.config[x]=_9c[x];}}break;}}}d.baseUrl=d.config.baseUrl;var n=navigator;var dua=n.userAgent,dav=n.appVersion,tv=parseFloat(dav);if(dua.indexOf("Opera")>=0){d.isOpera=tv;}if(dua.indexOf("AdobeAIR")>=0){d.isAIR=1;}d.isKhtml=(dav.indexOf("Konqueror")>=0)?tv:0;d.isWebKit=parseFloat(dua.split("WebKit/")[1])||undefined;d.isChrome=parseFloat(dua.split("Chrome/")[1])||undefined;d.isMac=dav.indexOf("Macintosh")>=0;var _9d=Math.max(dav.indexOf("WebKit"),dav.indexOf("Safari"),0);if(_9d&&!dojo.isChrome){d.isSafari=parseFloat(dav.split("Version/")[1]);if(!d.isSafari||parseFloat(dav.substr(_9d+7))<=419.3){d.isSafari=2;}}if(dua.indexOf("Gecko")>=0&&!d.isKhtml&&!d.isWebKit){d.isMozilla=d.isMoz=tv;}if(d.isMoz){d.isFF=parseFloat(dua.split("Firefox/")[1]||dua.split("Minefield/")[1])||undefined;}if(document.all&&!d.isOpera){d.isIE=parseFloat(dav.split("MSIE ")[1])||undefined;var _9e=document.documentMode;if(_9e&&_9e!=5&&Math.floor(d.isIE)!=_9e){d.isIE=_9e;}}if(dojo.isIE&&window.location.protocol==="file:"){dojo.config.ieForceActiveXXhr=true;}d.isQuirks=document.compatMode=="BackCompat";d.locale=dojo.config.locale||(d.isIE?n.userLanguage:n.language).toLowerCase();d._XMLHTTP_PROGIDS=["Msxml2.XMLHTTP","Microsoft.XMLHTTP","Msxml2.XMLHTTP.4.0"];d._xhrObj=function(){var _9f,_a0;if(!dojo.isIE||!dojo.config.ieForceActiveXXhr){try{_9f=new XMLHttpRequest();}catch(e){}}if(!_9f){for(var i=0;i<3;++i){var _a1=d._XMLHTTP_PROGIDS[i];try{_9f=new ActiveXObject(_a1);}catch(e){_a0=e;}if(_9f){d._XMLHTTP_PROGIDS=[_a1];break;}}}if(!_9f){throw new Error("XMLHTTP not available: "+_a0);}return _9f;};d._isDocumentOk=function(_a2){var _a3=_a2.status||0,lp=location.protocol;return (_a3>=200&&_a3<300)||_a3==304||_a3==1223||(!_a3&&(lp=="file:"||lp=="chrome:"||lp=="chrome-extension:"||lp=="app:"));};var _a4=window.location+"";var _a5=document.getElementsByTagName("base");var _a6=(_a5&&_a5.length>0);d._getText=function(uri,_a7){var _a8=d._xhrObj();if(!_a6&&dojo._Url){uri=(new dojo._Url(_a4,uri)).toString();}if(d.config.cacheBust){uri+="";uri+=(uri.indexOf("?")==-1?"?":"&")+String(d.config.cacheBust).replace(/\W+/g,"");}_a8.open("GET",uri,false);try{_a8.send(null);if(!d._isDocumentOk(_a8)){var err=Error("Unable to load "+uri+" status:"+_a8.status);err.status=_a8.status;err.responseText=_a8.responseText;throw err;}}catch(e){if(_a7){return null;}throw e;}return _a8.responseText;};var _a9=window;var _aa=function(_ab,fp){var _ac=_a9.attachEvent||_a9.addEventListener;_ab=_a9.attachEvent?_ab:_ab.substring(2);_ac(_ab,function(){fp.apply(_a9,arguments);},false);};d._windowUnloaders=[];d.windowUnloaded=function(){var mll=d._windowUnloaders;while(mll.length){(mll.pop())();}d=null;};var _ad=0;d.addOnWindowUnload=function(obj,_ae){d._onto(d._windowUnloaders,obj,_ae);if(!_ad){_ad=1;_aa("onunload",d.windowUnloaded);}};var _af=0;d.addOnUnload=function(obj,_b0){d._onto(d._unloaders,obj,_b0);if(!_af){_af=1;_aa("onbeforeunload",dojo.unloaded);}};})();dojo._initFired=false;dojo._loadInit=function(e){if(dojo._scrollIntervalId){clearInterval(dojo._scrollIntervalId);dojo._scrollIntervalId=0;}if(!dojo._initFired){dojo._initFired=true;if(!dojo.config.afterOnLoad&&window.detachEvent){window.detachEvent("onload",dojo._loadInit);}if(dojo._inFlightCount==0){dojo._modulesLoaded();}}};if(!dojo.config.afterOnLoad){if(document.addEventListener){document.addEventListener("DOMContentLoaded",dojo._loadInit,false);window.addEventListener("load",dojo._loadInit,false);}else{if(window.attachEvent){window.attachEvent("onload",dojo._loadInit);if(!dojo.config.skipIeDomLoaded&&self===self.top){dojo._scrollIntervalId=setInterval(function(){try{if(document.body){document.documentElement.doScroll("left");dojo._loadInit();}}catch(e){}},30);}}}}if(dojo.isIE){try{(function(){document.namespaces.add("v","urn:schemas-microsoft-com:vml");var _b1=["*","group","roundrect","oval","shape","rect","imagedata","path","textpath","text"],i=0,l=1,s=document.createStyleSheet();if(dojo.isIE>=8){i=1;l=_b1.length;}for(;i<l;++i){s.addRule("v\\:"+_b1[i],"behavior:url(#default#VML); display:inline-block");}})();}catch(e){}}}(function(){var mp=dojo.config["modulePaths"];if(mp){for(var _b2 in mp){dojo.registerModulePath(_b2,mp[_b2]);}}})();if(dojo.config.isDebug){dojo.require("dojo._firebug.firebug");}if(dojo.config.debugAtAllCosts){dojo.config.useXDomain=true;dojo.require("dojo._base._loader.loader_xd");dojo.require("dojo._base._loader.loader_debug");}if(!dojo._hasResource["dojo._base.lang"]){dojo._hasResource["dojo._base.lang"]=true;dojo.provide("dojo._base.lang");(function(){var d=dojo,_b3=Object.prototype.toString;dojo.isString=function(it){return (typeof it=="string"||it instanceof String);};dojo.isArray=function(it){return it&&(it instanceof Array||typeof it=="array");};dojo.isFunction=function(it){return _b3.call(it)==="[object Function]";};dojo.isObject=function(it){return it!==undefined&&(it===null||typeof it=="object"||d.isArray(it)||d.isFunction(it));};dojo.isArrayLike=function(it){return it&&it!==undefined&&!d.isString(it)&&!d.isFunction(it)&&!(it.tagName&&it.tagName.toLowerCase()=="form")&&(d.isArray(it)||isFinite(it.length));};dojo.isAlien=function(it){return it&&!d.isFunction(it)&&/\{\s*\[native code\]\s*\}/.test(String(it));};dojo.extend=function(_b4,_b5){for(var i=1,l=arguments.length;i<l;i++){d._mixin(_b4.prototype,arguments[i]);}return _b4;};dojo._hitchArgs=function(_b6,_b7){var pre=d._toArray(arguments,2);var _b8=d.isString(_b7);return function(){var _b9=d._toArray(arguments);var f=_b8?(_b6||d.global)[_b7]:_b7;return f&&f.apply(_b6||this,pre.concat(_b9));};};dojo.hitch=function(_ba,_bb){if(arguments.length>2){return d._hitchArgs.apply(d,arguments);}if(!_bb){_bb=_ba;_ba=null;}if(d.isString(_bb)){_ba=_ba||d.global;if(!_ba[_bb]){throw (["dojo.hitch: scope[\"",_bb,"\"] is null (scope=\"",_ba,"\")"].join(""));}return function(){return _ba[_bb].apply(_ba,arguments||[]);};}return !_ba?_bb:function(){return _bb.apply(_ba,arguments||[]);};};dojo.delegate=dojo._delegate=(function(){function TMP(){};return function(obj,_bc){TMP.prototype=obj;var tmp=new TMP();TMP.prototype=null;if(_bc){d._mixin(tmp,_bc);}return tmp;};})();var _bd=function(obj,_be,_bf){return (_bf||[]).concat(Array.prototype.slice.call(obj,_be||0));};var _c0=function(obj,_c1,_c2){var arr=_c2||[];for(var x=_c1||0;x<obj.length;x++){arr.push(obj[x]);}return arr;};dojo._toArray=d.isIE?function(obj){return ((obj.item)?_c0:_bd).apply(this,arguments);}:_bd;dojo.partial=function(_c3){var arr=[null];return d.hitch.apply(d,arr.concat(d._toArray(arguments)));};var _c4=d._extraNames,_c5=_c4.length,_c6={};dojo.clone=function(o){if(!o||typeof o!="object"||d.isFunction(o)){return o;}if(o.nodeType&&"cloneNode" in o){return o.cloneNode(true);}if(o instanceof Date){return new Date(o.getTime());}var r,i,l,s,_c7;if(d.isArray(o)){r=[];for(i=0,l=o.length;i<l;++i){if(i in o){r.push(d.clone(o[i]));}}}else{r=o.constructor?new o.constructor():{};}for(_c7 in o){s=o[_c7];if(!(_c7 in r)||(r[_c7]!==s&&(!(_c7 in _c6)||_c6[_c7]!==s))){r[_c7]=d.clone(s);}}if(_c5){for(i=0;i<_c5;++i){_c7=_c4[i];s=o[_c7];if(!(_c7 in r)||(r[_c7]!==s&&(!(_c7 in _c6)||_c6[_c7]!==s))){r[_c7]=s;}}}return r;};dojo.trim=String.prototype.trim?function(str){return str.trim();}:function(str){return str.replace(/^\s\s*/,"").replace(/\s\s*$/,"");};var _c8=/\{([^\}]+)\}/g;dojo.replace=function(_c9,map,_ca){return _c9.replace(_ca||_c8,d.isFunction(map)?map:function(_cb,k){return d.getObject(k,false,map);});};})();}if(!dojo._hasResource["dojo._base.array"]){dojo._hasResource["dojo._base.array"]=true;dojo.provide("dojo._base.array");(function(){var _cc=function(arr,obj,cb){return [(typeof arr=="string")?arr.split(""):arr,obj||dojo.global,(typeof cb=="string")?new Function("item","index","array",cb):cb];};var _cd=function(_ce,arr,_cf,_d0){var _d1=_cc(arr,_d0,_cf);arr=_d1[0];for(var i=0,l=arr.length;i<l;++i){var _d2=!!_d1[2].call(_d1[1],arr[i],i,arr);if(_ce^_d2){return _d2;}}return _ce;};dojo.mixin(dojo,{indexOf:function(_d3,_d4,_d5,_d6){var _d7=1,end=_d3.length||0,i=0;if(_d6){i=end-1;_d7=end=-1;}if(_d5!=undefined){i=_d5;}if((_d6&&i>end)||i<end){for(;i!=end;i+=_d7){if(_d3[i]==_d4){return i;}}}return -1;},lastIndexOf:function(_d8,_d9,_da){return dojo.indexOf(_d8,_d9,_da,true);},forEach:function(arr,_db,_dc){if(!arr||!arr.length){return;}var _dd=_cc(arr,_dc,_db);arr=_dd[0];for(var i=0,l=arr.length;i<l;++i){_dd[2].call(_dd[1],arr[i],i,arr);}},every:function(arr,_de,_df){return _cd(true,arr,_de,_df);},some:function(arr,_e0,_e1){return _cd(false,arr,_e0,_e1);},map:function(arr,_e2,_e3){var _e4=_cc(arr,_e3,_e2);arr=_e4[0];var _e5=(arguments[3]?(new arguments[3]()):[]);for(var i=0,l=arr.length;i<l;++i){_e5.push(_e4[2].call(_e4[1],arr[i],i,arr));}return _e5;},filter:function(arr,_e6,_e7){var _e8=_cc(arr,_e7,_e6);arr=_e8[0];var _e9=[];for(var i=0,l=arr.length;i<l;++i){if(_e8[2].call(_e8[1],arr[i],i,arr)){_e9.push(arr[i]);}}return _e9;}});})();}if(!dojo._hasResource["dojo._base.declare"]){dojo._hasResource["dojo._base.declare"]=true;dojo.provide("dojo._base.declare");(function(){var d=dojo,mix=d._mixin,op=Object.prototype,_ea=op.toString,_eb=new Function,_ec=0,_ed="constructor";function err(msg){throw new Error("declare: "+msg);};function _ee(_ef){var _f0=[],_f1=[{cls:0,refs:[]}],_f2={},_f3=1,l=_ef.length,i=0,j,lin,_f4,top,_f5,rec,_f6,_f7;for(;i<l;++i){_f4=_ef[i];if(!_f4){err("mixin #"+i+" is unknown. Did you use dojo.require to pull it in?");}else{if(_ea.call(_f4)!="[object Function]"){err("mixin #"+i+" is not a callable constructor.");}}lin=_f4._meta?_f4._meta.bases:[_f4];top=0;for(j=lin.length-1;j>=0;--j){_f5=lin[j].prototype;if(!_f5.hasOwnProperty("declaredClass")){_f5.declaredClass="uniqName_"+(_ec++);}_f6=_f5.declaredClass;if(!_f2.hasOwnProperty(_f6)){_f2[_f6]={count:0,refs:[],cls:lin[j]};++_f3;}rec=_f2[_f6];if(top&&top!==rec){rec.refs.push(top);++top.count;}top=rec;}++top.count;_f1[0].refs.push(top);}while(_f1.length){top=_f1.pop();_f0.push(top.cls);--_f3;while(_f7=top.refs,_f7.length==1){top=_f7[0];if(!top||--top.count){top=0;break;}_f0.push(top.cls);--_f3;}if(top){for(i=0,l=_f7.length;i<l;++i){top=_f7[i];if(!--top.count){_f1.push(top);}}}}if(_f3){err("can't build consistent linearization");}_f4=_ef[0];_f0[0]=_f4?_f4._meta&&_f4===_f0[_f0.length-_f4._meta.bases.length]?_f4._meta.bases.length:1:0;return _f0;};function _f8(_f9,a,f){var _fa,_fb,_fc,_fd,_fe,_ff,_100,opf,pos,_101=this._inherited=this._inherited||{};if(typeof _f9=="string"){_fa=_f9;_f9=a;a=f;}f=0;_fd=_f9.callee;_fa=_fa||_fd.nom;if(!_fa){err("can't deduce a name to call inherited()");}_fe=this.constructor._meta;_fc=_fe.bases;pos=_101.p;if(_fa!=_ed){if(_101.c!==_fd){pos=0;_ff=_fc[0];_fe=_ff._meta;if(_fe.hidden[_fa]!==_fd){_fb=_fe.chains;if(_fb&&typeof _fb[_fa]=="string"){err("calling chained method with inherited: "+_fa);}do{_fe=_ff._meta;_100=_ff.prototype;if(_fe&&(_100[_fa]===_fd&&_100.hasOwnProperty(_fa)||_fe.hidden[_fa]===_fd)){break;}}while(_ff=_fc[++pos]);pos=_ff?pos:-1;}}_ff=_fc[++pos];if(_ff){_100=_ff.prototype;if(_ff._meta&&_100.hasOwnProperty(_fa)){f=_100[_fa];}else{opf=op[_fa];do{_100=_ff.prototype;f=_100[_fa];if(f&&(_ff._meta?_100.hasOwnProperty(_fa):f!==opf)){break;}}while(_ff=_fc[++pos]);}}f=_ff&&f||op[_fa];}else{if(_101.c!==_fd){pos=0;_fe=_fc[0]._meta;if(_fe&&_fe.ctor!==_fd){_fb=_fe.chains;if(!_fb||_fb.constructor!=="manual"){err("calling chained constructor with inherited");}while(_ff=_fc[++pos]){_fe=_ff._meta;if(_fe&&_fe.ctor===_fd){break;}}pos=_ff?pos:-1;}}while(_ff=_fc[++pos]){_fe=_ff._meta;f=_fe?_fe.ctor:_ff;if(f){break;}}f=_ff&&f;}_101.c=f;_101.p=pos;if(f){return a===true?f:f.apply(this,a||_f9);}};function _102(name,args){if(typeof name=="string"){return this.inherited(name,args,true);}return this.inherited(name,true);};function _103(cls){var _104=this.constructor._meta.bases;for(var i=0,l=_104.length;i<l;++i){if(_104[i]===cls){return true;}}return this instanceof cls;};function _105(_106,_107){var name,i=0,l=d._extraNames.length;for(name in _107){if(name!=_ed&&_107.hasOwnProperty(name)){_106[name]=_107[name];}}for(;i<l;++i){name=d._extraNames[i];if(name!=_ed&&_107.hasOwnProperty(name)){_106[name]=_107[name];}}};function _108(_109,_10a){var name,t,i=0,l=d._extraNames.length;for(name in _10a){t=_10a[name];if((t!==op[name]||!(name in op))&&name!=_ed){if(_ea.call(t)=="[object Function]"){t.nom=name;}_109[name]=t;}}for(;i<l;++i){name=d._extraNames[i];t=_10a[name];if((t!==op[name]||!(name in op))&&name!=_ed){if(_ea.call(t)=="[object Function]"){t.nom=name;}_109[name]=t;}}return _109;};function _10b(_10c){_108(this.prototype,_10c);return this;};function _10d(_10e,_10f){return function(){var a=arguments,args=a,a0=a[0],f,i,m,l=_10e.length,_110;if(!(this instanceof a.callee)){return _111(a);}if(_10f&&(a0&&a0.preamble||this.preamble)){_110=new Array(_10e.length);_110[0]=a;for(i=0;;){a0=a[0];if(a0){f=a0.preamble;if(f){a=f.apply(this,a)||a;}}f=_10e[i].prototype;f=f.hasOwnProperty("preamble")&&f.preamble;if(f){a=f.apply(this,a)||a;}if(++i==l){break;}_110[i]=a;}}for(i=l-1;i>=0;--i){f=_10e[i];m=f._meta;f=m?m.ctor:f;if(f){f.apply(this,_110?_110[i]:a);}}f=this.postscript;if(f){f.apply(this,args);}};};function _112(ctor,_113){return function(){var a=arguments,t=a,a0=a[0],f;if(!(this instanceof a.callee)){return _111(a);}if(_113){if(a0){f=a0.preamble;if(f){t=f.apply(this,t)||t;}}f=this.preamble;if(f){f.apply(this,t);}}if(ctor){ctor.apply(this,a);}f=this.postscript;if(f){f.apply(this,a);}};};function _114(_115){return function(){var a=arguments,i=0,f,m;if(!(this instanceof a.callee)){return _111(a);}for(;f=_115[i];++i){m=f._meta;f=m?m.ctor:f;if(f){f.apply(this,a);break;}}f=this.postscript;if(f){f.apply(this,a);}};};function _116(name,_117,_118){return function(){var b,m,f,i=0,step=1;if(_118){i=_117.length-1;step=-1;}for(;b=_117[i];i+=step){m=b._meta;f=(m?m.hidden:b.prototype)[name];if(f){f.apply(this,arguments);}}};};function _119(ctor){_eb.prototype=ctor.prototype;var t=new _eb;_eb.prototype=null;return t;};function _111(args){var ctor=args.callee,t=_119(ctor);ctor.apply(t,args);return t;};d.declare=function(_11a,_11b,_11c){if(typeof _11a!="string"){_11c=_11b;_11b=_11a;_11a="";}_11c=_11c||{};var _11d,i,t,ctor,name,_11e,_11f,_120=1,_121=_11b;if(_ea.call(_11b)=="[object Array]"){_11e=_ee(_11b);t=_11e[0];_120=_11e.length-t;_11b=_11e[_120];}else{_11e=[0];if(_11b){if(_ea.call(_11b)=="[object Function]"){t=_11b._meta;_11e=_11e.concat(t?t.bases:_11b);}else{err("base class is not a callable constructor.");}}else{if(_11b!==null){err("unknown base class. Did you use dojo.require to pull it in?");}}}if(_11b){for(i=_120-1;;--i){_11d=_119(_11b);if(!i){break;}t=_11e[i];(t._meta?_105:mix)(_11d,t.prototype);ctor=new Function;ctor.superclass=_11b;ctor.prototype=_11d;_11b=_11d.constructor=ctor;}}else{_11d={};}_108(_11d,_11c);t=_11c.constructor;if(t!==op.constructor){t.nom=_ed;_11d.constructor=t;}for(i=_120-1;i;--i){t=_11e[i]._meta;if(t&&t.chains){_11f=mix(_11f||{},t.chains);}}if(_11d["-chains-"]){_11f=mix(_11f||{},_11d["-chains-"]);}t=!_11f||!_11f.hasOwnProperty(_ed);_11e[0]=ctor=(_11f&&_11f.constructor==="manual")?_114(_11e):(_11e.length==1?_112(_11c.constructor,t):_10d(_11e,t));ctor._meta={bases:_11e,hidden:_11c,chains:_11f,parents:_121,ctor:_11c.constructor};ctor.superclass=_11b&&_11b.prototype;ctor.extend=_10b;ctor.prototype=_11d;_11d.constructor=ctor;_11d.getInherited=_102;_11d.inherited=_f8;_11d.isInstanceOf=_103;if(_11a){_11d.declaredClass=_11a;d.setObject(_11a,ctor);}if(_11f){for(name in _11f){if(_11d[name]&&typeof _11f[name]=="string"&&name!=_ed){t=_11d[name]=_116(name,_11e,_11f[name]==="after");t.nom=name;}}}return ctor;};d.safeMixin=_108;})();}if(!dojo._hasResource["dojo._base.connect"]){dojo._hasResource["dojo._base.connect"]=true;dojo.provide("dojo._base.connect");dojo._listener={getDispatcher:function(){return function(){var ap=Array.prototype,c=arguments.callee,ls=c._listeners,t=c.target;var r=t&&t.apply(this,arguments);var i,lls;lls=[].concat(ls);for(i in lls){if(!(i in ap)){lls[i].apply(this,arguments);}}return r;};},add:function(_122,_123,_124){_122=_122||dojo.global;var f=_122[_123];if(!f||!f._listeners){var d=dojo._listener.getDispatcher();d.target=f;d._listeners=[];f=_122[_123]=d;}return f._listeners.push(_124);},remove:function(_125,_126,_127){var f=(_125||dojo.global)[_126];if(f&&f._listeners&&_127--){delete f._listeners[_127];}}};dojo.connect=function(obj,_128,_129,_12a,_12b){var a=arguments,args=[],i=0;args.push(dojo.isString(a[0])?null:a[i++],a[i++]);var a1=a[i+1];args.push(dojo.isString(a1)||dojo.isFunction(a1)?a[i++]:null,a[i++]);for(var l=a.length;i<l;i++){args.push(a[i]);}return dojo._connect.apply(this,args);};dojo._connect=function(obj,_12c,_12d,_12e){var l=dojo._listener,h=l.add(obj,_12c,dojo.hitch(_12d,_12e));return [obj,_12c,h,l];};dojo.disconnect=function(_12f){if(_12f&&_12f[0]!==undefined){dojo._disconnect.apply(this,_12f);delete _12f[0];}};dojo._disconnect=function(obj,_130,_131,_132){_132.remove(obj,_130,_131);};dojo._topics={};dojo.subscribe=function(_133,_134,_135){return [_133,dojo._listener.add(dojo._topics,_133,dojo.hitch(_134,_135))];};dojo.unsubscribe=function(_136){if(_136){dojo._listener.remove(dojo._topics,_136[0],_136[1]);}};dojo.publish=function(_137,args){var f=dojo._topics[_137];if(f){f.apply(this,args||[]);}};dojo.connectPublisher=function(_138,obj,_139){var pf=function(){dojo.publish(_138,arguments);};return _139?dojo.connect(obj,_139,pf):dojo.connect(obj,pf);};}if(!dojo._hasResource["dojo._base.Deferred"]){dojo._hasResource["dojo._base.Deferred"]=true;dojo.provide("dojo._base.Deferred");(function(){var _13a=function(){};var _13b=Object.freeze||function(){};dojo.Deferred=function(_13c){var _13d,_13e,_13f,head,_140;var _141=this.promise={};function _142(_143){if(_13e){throw new Error("This deferred has already been resolved");}_13d=_143;_13e=true;_144();};function _144(){var _145;while(!_145&&_140){var _146=_140;_140=_140.next;if(_145=(_146.progress==_13a)){_13e=false;}var func=(_13f?_146.error:_146.resolved);if(func){try{var _147=func(_13d);if(_147&&typeof _147.then==="function"){_147.then(dojo.hitch(_146.deferred,"resolve"),dojo.hitch(_146.deferred,"reject"));continue;}var _148=_145&&_147===undefined;_146.deferred[_148&&_13f?"reject":"resolve"](_148?_13d:_147);}catch(e){_146.deferred.reject(e);}}else{if(_13f){_146.deferred.reject(_13d);}else{_146.deferred.resolve(_13d);}}}};this.resolve=this.callback=function(_149){this.fired=0;this.results=[_149,null];_142(_149);};this.reject=this.errback=function(_14a){_13f=true;this.fired=1;_142(_14a);this.results=[null,_14a];if(!_14a||_14a.log!==false){(dojo.config.deferredOnError||function(x){console.error(x);})(_14a);}};this.progress=function(_14b){var _14c=_140;while(_14c){var _14d=_14c.progress;_14d&&_14d(_14b);_14c=_14c.next;}};this.addCallbacks=function(_14e,_14f){this.then(_14e,_14f,_13a);return this;};this.then=_141.then=function(_150,_151,_152){var _153=_152==_13a?this:new dojo.Deferred(_141.cancel);var _154={resolved:_150,error:_151,progress:_152,deferred:_153};if(_140){head=head.next=_154;}else{_140=head=_154;}if(_13e){_144();}return _153.promise;};var _155=this;this.cancel=_141.cancel=function(){if(!_13e){var _156=_13c&&_13c(_155);if(!_13e){if(!(_156 instanceof Error)){_156=new Error(_156);}_156.log=false;_155.reject(_156);}}};_13b(_141);};dojo.extend(dojo.Deferred,{addCallback:function(_157){return this.addCallbacks(dojo.hitch.apply(dojo,arguments));},addErrback:function(_158){return this.addCallbacks(null,dojo.hitch.apply(dojo,arguments));},addBoth:function(_159){var _15a=dojo.hitch.apply(dojo,arguments);return this.addCallbacks(_15a,_15a);},fired:-1});})();dojo.when=function(_15b,_15c,_15d,_15e){if(_15b&&typeof _15b.then==="function"){return _15b.then(_15c,_15d,_15e);}return _15c(_15b);};}if(!dojo._hasResource["dojo._base.json"]){dojo._hasResource["dojo._base.json"]=true;dojo.provide("dojo._base.json");dojo.fromJson=function(json){return eval("("+json+")");};dojo._escapeString=function(str){return ("\""+str.replace(/(["\\])/g,"\\$1")+"\"").replace(/[\f]/g,"\\f").replace(/[\b]/g,"\\b").replace(/[\n]/g,"\\n").replace(/[\t]/g,"\\t").replace(/[\r]/g,"\\r");};dojo.toJsonIndentStr="\t";dojo.toJson=function(it,_15f,_160){if(it===undefined){return "undefined";}var _161=typeof it;if(_161=="number"||_161=="boolean"){return it+"";}if(it===null){return "null";}if(dojo.isString(it)){return dojo._escapeString(it);}var _162=arguments.callee;var _163;_160=_160||"";var _164=_15f?_160+dojo.toJsonIndentStr:"";var tf=it.__json__||it.json;if(dojo.isFunction(tf)){_163=tf.call(it);if(it!==_163){return _162(_163,_15f,_164);}}if(it.nodeType&&it.cloneNode){throw new Error("Can't serialize DOM nodes");}var sep=_15f?" ":"";var _165=_15f?"\n":"";if(dojo.isArray(it)){var res=dojo.map(it,function(obj){var val=_162(obj,_15f,_164);if(typeof val!="string"){val="undefined";}return _165+_164+val;});return "["+res.join(","+sep)+_165+_160+"]";}if(_161=="function"){return null;}var _166=[],key;for(key in it){var _167,val;if(typeof key=="number"){_167="\""+key+"\"";}else{if(typeof key=="string"){_167=dojo._escapeString(key);}else{continue;}}val=_162(it[key],_15f,_164);if(typeof val!="string"){continue;}_166.push(_165+_164+_167+":"+sep+val);}return "{"+_166.join(","+sep)+_165+_160+"}";};}if(!dojo._hasResource["dojo._base.Color"]){dojo._hasResource["dojo._base.Color"]=true;dojo.provide("dojo._base.Color");(function(){var d=dojo;dojo.Color=function(_168){if(_168){this.setColor(_168);}};dojo.Color.named={black:[0,0,0],silver:[192,192,192],gray:[128,128,128],white:[255,255,255],maroon:[128,0,0],red:[255,0,0],purple:[128,0,128],fuchsia:[255,0,255],green:[0,128,0],lime:[0,255,0],olive:[128,128,0],yellow:[255,255,0],navy:[0,0,128],blue:[0,0,255],teal:[0,128,128],aqua:[0,255,255],transparent:d.config.transparentColor||[255,255,255]};dojo.extend(dojo.Color,{r:255,g:255,b:255,a:1,_set:function(r,g,b,a){var t=this;t.r=r;t.g=g;t.b=b;t.a=a;},setColor:function(_169){if(d.isString(_169)){d.colorFromString(_169,this);}else{if(d.isArray(_169)){d.colorFromArray(_169,this);}else{this._set(_169.r,_169.g,_169.b,_169.a);if(!(_169 instanceof d.Color)){this.sanitize();}}}return this;},sanitize:function(){return this;},toRgb:function(){var t=this;return [t.r,t.g,t.b];},toRgba:function(){var t=this;return [t.r,t.g,t.b,t.a];},toHex:function(){var arr=d.map(["r","g","b"],function(x){var s=this[x].toString(16);return s.length<2?"0"+s:s;},this);return "#"+arr.join("");},toCss:function(_16a){var t=this,rgb=t.r+", "+t.g+", "+t.b;return (_16a?"rgba("+rgb+", "+t.a:"rgb("+rgb)+")";},toString:function(){return this.toCss(true);}});dojo.blendColors=function(_16b,end,_16c,obj){var t=obj||new d.Color();d.forEach(["r","g","b","a"],function(x){t[x]=_16b[x]+(end[x]-_16b[x])*_16c;if(x!="a"){t[x]=Math.round(t[x]);}});return t.sanitize();};dojo.colorFromRgb=function(_16d,obj){var m=_16d.toLowerCase().match(/^rgba?\(([\s\.,0-9]+)\)/);return m&&dojo.colorFromArray(m[1].split(/\s*,\s*/),obj);};dojo.colorFromHex=function(_16e,obj){var t=obj||new d.Color(),bits=(_16e.length==4)?4:8,mask=(1<<bits)-1;_16e=Number("0x"+_16e.substr(1));if(isNaN(_16e)){return null;}d.forEach(["b","g","r"],function(x){var c=_16e&mask;_16e>>=bits;t[x]=bits==4?17*c:c;});t.a=1;return t;};dojo.colorFromArray=function(a,obj){var t=obj||new d.Color();t._set(Number(a[0]),Number(a[1]),Number(a[2]),Number(a[3]));if(isNaN(t.a)){t.a=1;}return t.sanitize();};dojo.colorFromString=function(str,obj){var a=d.Color.named[str];return a&&d.colorFromArray(a,obj)||d.colorFromRgb(str,obj)||d.colorFromHex(str,obj);};})();}if(!dojo._hasResource["dojo._base"]){dojo._hasResource["dojo._base"]=true;dojo.provide("dojo._base");}if(!dojo._hasResource["dojo._base.window"]){dojo._hasResource["dojo._base.window"]=true;dojo.provide("dojo._base.window");dojo.doc=window["document"]||null;dojo.body=function(){return dojo.doc.body||dojo.doc.getElementsByTagName("body")[0];};dojo.setContext=function(_16f,_170){dojo.global=_16f;dojo.doc=_170;};dojo.withGlobal=function(_171,_172,_173,_174){var _175=dojo.global;try{dojo.global=_171;return dojo.withDoc.call(null,_171.document,_172,_173,_174);}finally{dojo.global=_175;}};dojo.withDoc=function(_176,_177,_178,_179){var _17a=dojo.doc,_17b=dojo._bodyLtr,oldQ=dojo.isQuirks;try{dojo.doc=_176;delete dojo._bodyLtr;dojo.isQuirks=dojo.doc.compatMode=="BackCompat";if(_178&&typeof _177=="string"){_177=_178[_177];}return _177.apply(_178,_179||[]);}finally{dojo.doc=_17a;delete dojo._bodyLtr;if(_17b!==undefined){dojo._bodyLtr=_17b;}dojo.isQuirks=oldQ;}};}if(!dojo._hasResource["dojo._base.event"]){dojo._hasResource["dojo._base.event"]=true;dojo.provide("dojo._base.event");(function(){var del=(dojo._event_listener={add:function(node,name,fp){if(!node){return;}name=del._normalizeEventName(name);fp=del._fixCallback(name,fp);var _17c=name;if(!dojo.isIE&&(name=="mouseenter"||name=="mouseleave")){var ofp=fp;name=(name=="mouseenter")?"mouseover":"mouseout";fp=function(e){if(!dojo.isDescendant(e.relatedTarget,node)){return ofp.call(this,e);}};}node.addEventListener(name,fp,false);return fp;},remove:function(node,_17d,_17e){if(node){_17d=del._normalizeEventName(_17d);if(!dojo.isIE&&(_17d=="mouseenter"||_17d=="mouseleave")){_17d=(_17d=="mouseenter")?"mouseover":"mouseout";}node.removeEventListener(_17d,_17e,false);}},_normalizeEventName:function(name){return name.slice(0,2)=="on"?name.slice(2):name;},_fixCallback:function(name,fp){return name!="keypress"?fp:function(e){return fp.call(this,del._fixEvent(e,this));};},_fixEvent:function(evt,_17f){switch(evt.type){case "keypress":del._setKeyChar(evt);break;}return evt;},_setKeyChar:function(evt){evt.keyChar=evt.charCode?String.fromCharCode(evt.charCode):"";evt.charOrCode=evt.keyChar||evt.keyCode;},_punctMap:{106:42,111:47,186:59,187:43,188:44,189:45,190:46,191:47,192:96,219:91,220:92,221:93,222:39}});dojo.fixEvent=function(evt,_180){return del._fixEvent(evt,_180);};dojo.stopEvent=function(evt){evt.preventDefault();evt.stopPropagation();};var _181=dojo._listener;dojo._connect=function(obj,_182,_183,_184,_185){var _186=obj&&(obj.nodeType||obj.attachEvent||obj.addEventListener);var lid=_186?(_185?2:1):0,l=[dojo._listener,del,_181][lid];var h=l.add(obj,_182,dojo.hitch(_183,_184));return [obj,_182,h,lid];};dojo._disconnect=function(obj,_187,_188,_189){([dojo._listener,del,_181][_189]).remove(obj,_187,_188);};dojo.keys={BACKSPACE:8,TAB:9,CLEAR:12,ENTER:13,SHIFT:16,CTRL:17,ALT:18,META:dojo.isSafari?91:224,PAUSE:19,CAPS_LOCK:20,ESCAPE:27,SPACE:32,PAGE_UP:33,PAGE_DOWN:34,END:35,HOME:36,LEFT_ARROW:37,UP_ARROW:38,RIGHT_ARROW:39,DOWN_ARROW:40,INSERT:45,DELETE:46,HELP:47,LEFT_WINDOW:91,RIGHT_WINDOW:92,SELECT:93,NUMPAD_0:96,NUMPAD_1:97,NUMPAD_2:98,NUMPAD_3:99,NUMPAD_4:100,NUMPAD_5:101,NUMPAD_6:102,NUMPAD_7:103,NUMPAD_8:104,NUMPAD_9:105,NUMPAD_MULTIPLY:106,NUMPAD_PLUS:107,NUMPAD_ENTER:108,NUMPAD_MINUS:109,NUMPAD_PERIOD:110,NUMPAD_DIVIDE:111,F1:112,F2:113,F3:114,F4:115,F5:116,F6:117,F7:118,F8:119,F9:120,F10:121,F11:122,F12:123,F13:124,F14:125,F15:126,NUM_LOCK:144,SCROLL_LOCK:145,copyKey:dojo.isMac&&!dojo.isAIR?(dojo.isSafari?91:224):17};var _18a=dojo.isMac?"metaKey":"ctrlKey";dojo.isCopyKey=function(e){return e[_18a];};if(dojo.isIE){dojo.mouseButtons={LEFT:1,MIDDLE:4,RIGHT:2,isButton:function(e,_18b){return e.button&_18b;},isLeft:function(e){return e.button&1;},isMiddle:function(e){return e.button&4;},isRight:function(e){return e.button&2;}};}else{dojo.mouseButtons={LEFT:0,MIDDLE:1,RIGHT:2,isButton:function(e,_18c){return e.button==_18c;},isLeft:function(e){return e.button==0;},isMiddle:function(e){return e.button==1;},isRight:function(e){return e.button==2;}};}if(dojo.isIE){var _18d=function(e,code){try{return (e.keyCode=code);}catch(e){return 0;}};var iel=dojo._listener;var _18e=(dojo._ieListenersName="_"+dojo._scopeName+"_listeners");if(!dojo.config._allow_leaks){_181=iel=dojo._ie_listener={handlers:[],add:function(_18f,_190,_191){_18f=_18f||dojo.global;var f=_18f[_190];if(!f||!f[_18e]){var d=dojo._getIeDispatcher();d.target=f&&(ieh.push(f)-1);d[_18e]=[];f=_18f[_190]=d;}return f[_18e].push(ieh.push(_191)-1);},remove:function(_192,_193,_194){var f=(_192||dojo.global)[_193],l=f&&f[_18e];if(f&&l&&_194--){delete ieh[l[_194]];delete l[_194];}}};var ieh=iel.handlers;}dojo.mixin(del,{add:function(node,_195,fp){if(!node){return;}_195=del._normalizeEventName(_195);if(_195=="onkeypress"){var kd=node.onkeydown;if(!kd||!kd[_18e]||!kd._stealthKeydownHandle){var h=del.add(node,"onkeydown",del._stealthKeyDown);kd=node.onkeydown;kd._stealthKeydownHandle=h;kd._stealthKeydownRefs=1;}else{kd._stealthKeydownRefs++;}}return iel.add(node,_195,del._fixCallback(fp));},remove:function(node,_196,_197){_196=del._normalizeEventName(_196);iel.remove(node,_196,_197);if(_196=="onkeypress"){var kd=node.onkeydown;if(--kd._stealthKeydownRefs<=0){iel.remove(node,"onkeydown",kd._stealthKeydownHandle);delete kd._stealthKeydownHandle;}}},_normalizeEventName:function(_198){return _198.slice(0,2)!="on"?"on"+_198:_198;},_nop:function(){},_fixEvent:function(evt,_199){if(!evt){var w=_199&&(_199.ownerDocument||_199.document||_199).parentWindow||window;evt=w.event;}if(!evt){return (evt);}evt.target=evt.srcElement;evt.currentTarget=(_199||evt.srcElement);evt.layerX=evt.offsetX;evt.layerY=evt.offsetY;var se=evt.srcElement,doc=(se&&se.ownerDocument)||document;var _19a=((dojo.isIE<6)||(doc["compatMode"]=="BackCompat"))?doc.body:doc.documentElement;var _19b=dojo._getIeDocumentElementOffset();evt.pageX=evt.clientX+dojo._fixIeBiDiScrollLeft(_19a.scrollLeft||0)-_19b.x;evt.pageY=evt.clientY+(_19a.scrollTop||0)-_19b.y;if(evt.type=="mouseover"){evt.relatedTarget=evt.fromElement;}if(evt.type=="mouseout"){evt.relatedTarget=evt.toElement;}evt.stopPropagation=del._stopPropagation;evt.preventDefault=del._preventDefault;return del._fixKeys(evt);},_fixKeys:function(evt){switch(evt.type){case "keypress":var c=("charCode" in evt?evt.charCode:evt.keyCode);if(c==10){c=0;evt.keyCode=13;}else{if(c==13||c==27){c=0;}else{if(c==3){c=99;}}}evt.charCode=c;del._setKeyChar(evt);break;}return evt;},_stealthKeyDown:function(evt){var kp=evt.currentTarget.onkeypress;if(!kp||!kp[_18e]){return;}var k=evt.keyCode;var _19c=k!=13&&k!=32&&k!=27&&(k<48||k>90)&&(k<96||k>111)&&(k<186||k>192)&&(k<219||k>222);if(_19c||evt.ctrlKey){var c=_19c?0:k;if(evt.ctrlKey){if(k==3||k==13){return;}else{if(c>95&&c<106){c-=48;}else{if((!evt.shiftKey)&&(c>=65&&c<=90)){c+=32;}else{c=del._punctMap[c]||c;}}}}var faux=del._synthesizeEvent(evt,{type:"keypress",faux:true,charCode:c});kp.call(evt.currentTarget,faux);evt.cancelBubble=faux.cancelBubble;evt.returnValue=faux.returnValue;_18d(evt,faux.keyCode);}},_stopPropagation:function(){this.cancelBubble=true;},_preventDefault:function(){this.bubbledKeyCode=this.keyCode;if(this.ctrlKey){_18d(this,0);}this.returnValue=false;}});dojo.stopEvent=function(evt){evt=evt||window.event;del._stopPropagation.call(evt);del._preventDefault.call(evt);};}del._synthesizeEvent=function(evt,_19d){var faux=dojo.mixin({},evt,_19d);del._setKeyChar(faux);faux.preventDefault=function(){evt.preventDefault();};faux.stopPropagation=function(){evt.stopPropagation();};return faux;};if(dojo.isOpera){dojo.mixin(del,{_fixEvent:function(evt,_19e){switch(evt.type){case "keypress":var c=evt.which;if(c==3){c=99;}c=c<41&&!evt.shiftKey?0:c;if(evt.ctrlKey&&!evt.shiftKey&&c>=65&&c<=90){c+=32;}return del._synthesizeEvent(evt,{charCode:c});}return evt;}});}if(dojo.isWebKit){del._add=del.add;del._remove=del.remove;dojo.mixin(del,{add:function(node,_19f,fp){if(!node){return;}var _1a0=del._add(node,_19f,fp);if(del._normalizeEventName(_19f)=="keypress"){_1a0._stealthKeyDownHandle=del._add(node,"keydown",function(evt){var k=evt.keyCode;var _1a1=k!=13&&k!=32&&(k<48||k>90)&&(k<96||k>111)&&(k<186||k>192)&&(k<219||k>222);if(_1a1||evt.ctrlKey){var c=_1a1?0:k;if(evt.ctrlKey){if(k==3||k==13){return;}else{if(c>95&&c<106){c-=48;}else{if(!evt.shiftKey&&c>=65&&c<=90){c+=32;}else{c=del._punctMap[c]||c;}}}}var faux=del._synthesizeEvent(evt,{type:"keypress",faux:true,charCode:c});fp.call(evt.currentTarget,faux);}});}return _1a0;},remove:function(node,_1a2,_1a3){if(node){if(_1a3._stealthKeyDownHandle){del._remove(node,"keydown",_1a3._stealthKeyDownHandle);}del._remove(node,_1a2,_1a3);}},_fixEvent:function(evt,_1a4){switch(evt.type){case "keypress":if(evt.faux){return evt;}var c=evt.charCode;c=c>=32?c:0;return del._synthesizeEvent(evt,{charCode:c,faux:true});}return evt;}});}})();if(dojo.isIE){dojo._ieDispatcher=function(args,_1a5){var ap=Array.prototype,h=dojo._ie_listener.handlers,c=args.callee,ls=c[dojo._ieListenersName],t=h[c.target];var r=t&&t.apply(_1a5,args);var lls=[].concat(ls);for(var i in lls){var f=h[lls[i]];if(!(i in ap)&&f){f.apply(_1a5,args);}}return r;};dojo._getIeDispatcher=function(){return new Function(dojo._scopeName+"._ieDispatcher(arguments, this)");};dojo._event_listener._fixCallback=function(fp){var f=dojo._event_listener._fixEvent;return function(e){return fp.call(this,f(e,this));};};}}if(!dojo._hasResource["dojo._base.html"]){dojo._hasResource["dojo._base.html"]=true;dojo.provide("dojo._base.html");try{document.execCommand("BackgroundImageCache",false,true);}catch(e){}if(dojo.isIE||dojo.isOpera){dojo.byId=function(id,doc){if(typeof id!="string"){return id;}var _1a6=doc||dojo.doc,te=_1a6.getElementById(id);if(te&&(te.attributes.id.value==id||te.id==id)){return te;}else{var eles=_1a6.all[id];if(!eles||eles.nodeName){eles=[eles];}var i=0;while((te=eles[i++])){if((te.attributes&&te.attributes.id&&te.attributes.id.value==id)||te.id==id){return te;}}}};}else{dojo.byId=function(id,doc){return (typeof id=="string")?(doc||dojo.doc).getElementById(id):id;};}(function(){var d=dojo;var byId=d.byId;var _1a7=null,_1a8;d.addOnWindowUnload(function(){_1a7=null;});dojo._destroyElement=dojo.destroy=function(node){node=byId(node);try{var doc=node.ownerDocument;if(!_1a7||_1a8!=doc){_1a7=doc.createElement("div");_1a8=doc;}_1a7.appendChild(node.parentNode?node.parentNode.removeChild(node):node);_1a7.innerHTML="";}catch(e){}};dojo.isDescendant=function(node,_1a9){try{node=byId(node);_1a9=byId(_1a9);while(node){if(node==_1a9){return true;}node=node.parentNode;}}catch(e){}return false;};dojo.setSelectable=function(node,_1aa){node=byId(node);if(d.isMozilla){node.style.MozUserSelect=_1aa?"":"none";}else{if(d.isKhtml||d.isWebKit){node.style.KhtmlUserSelect=_1aa?"auto":"none";}else{if(d.isIE){var v=(node.unselectable=_1aa?"":"on");d.query("*",node).forEach("item.unselectable = '"+v+"'");}}}};var _1ab=function(node,ref){var _1ac=ref.parentNode;if(_1ac){_1ac.insertBefore(node,ref);}};var _1ad=function(node,ref){var _1ae=ref.parentNode;if(_1ae){if(_1ae.lastChild==ref){_1ae.appendChild(node);}else{_1ae.insertBefore(node,ref.nextSibling);}}};dojo.place=function(node,_1af,_1b0){_1af=byId(_1af);if(typeof node=="string"){node=node.charAt(0)=="<"?d._toDom(node,_1af.ownerDocument):byId(node);}if(typeof _1b0=="number"){var cn=_1af.childNodes;if(!cn.length||cn.length<=_1b0){_1af.appendChild(node);}else{_1ab(node,cn[_1b0<0?0:_1b0]);}}else{switch(_1b0){case "before":_1ab(node,_1af);break;case "after":_1ad(node,_1af);break;case "replace":_1af.parentNode.replaceChild(node,_1af);break;case "only":d.empty(_1af);_1af.appendChild(node);break;case "first":if(_1af.firstChild){_1ab(node,_1af.firstChild);break;}default:_1af.appendChild(node);}}return node;};dojo.boxModel="content-box";if(d.isIE){d.boxModel=document.compatMode=="BackCompat"?"border-box":"content-box";}var gcs;if(d.isWebKit){gcs=function(node){var s;if(node.nodeType==1){var dv=node.ownerDocument.defaultView;s=dv.getComputedStyle(node,null);if(!s&&node.style){node.style.display="";s=dv.getComputedStyle(node,null);}}return s||{};};}else{if(d.isIE){gcs=function(node){return node.nodeType==1?node.currentStyle:{};};}else{gcs=function(node){return node.nodeType==1?node.ownerDocument.defaultView.getComputedStyle(node,null):{};};}}dojo.getComputedStyle=gcs;if(!d.isIE){d._toPixelValue=function(_1b1,_1b2){return parseFloat(_1b2)||0;};}else{d._toPixelValue=function(_1b3,_1b4){if(!_1b4){return 0;}if(_1b4=="medium"){return 4;}if(_1b4.slice&&_1b4.slice(-2)=="px"){return parseFloat(_1b4);}with(_1b3){var _1b5=style.left;var _1b6=runtimeStyle.left;runtimeStyle.left=currentStyle.left;try{style.left=_1b4;_1b4=style.pixelLeft;}catch(e){_1b4=0;}style.left=_1b5;runtimeStyle.left=_1b6;}return _1b4;};}var px=d._toPixelValue;var astr="DXImageTransform.Microsoft.Alpha";var af=function(n,f){try{return n.filters.item(astr);}catch(e){return f?{}:null;}};dojo._getOpacity=d.isIE?function(node){try{return af(node).Opacity/100;}catch(e){return 1;}}:function(node){return gcs(node).opacity;};dojo._setOpacity=d.isIE?function(node,_1b7){var ov=_1b7*100,_1b8=_1b7==1;node.style.zoom=_1b8?"":1;if(!af(node)){if(_1b8){return _1b7;}node.style.filter+=" progid:"+astr+"(Opacity="+ov+")";}else{af(node,1).Opacity=ov;}af(node,1).Enabled=!_1b8;if(node.nodeName.toLowerCase()=="tr"){d.query("> td",node).forEach(function(i){d._setOpacity(i,_1b7);});}return _1b7;}:function(node,_1b9){return node.style.opacity=_1b9;};var _1ba={left:true,top:true};var _1bb=/margin|padding|width|height|max|min|offset/;var _1bc=function(node,type,_1bd){type=type.toLowerCase();if(d.isIE){if(_1bd=="auto"){if(type=="height"){return node.offsetHeight;}if(type=="width"){return node.offsetWidth;}}if(type=="fontweight"){switch(_1bd){case 700:return "bold";case 400:default:return "normal";}}}if(!(type in _1ba)){_1ba[type]=_1bb.test(type);}return _1ba[type]?px(node,_1bd):_1bd;};var _1be=d.isIE?"styleFloat":"cssFloat",_1bf={"cssFloat":_1be,"styleFloat":_1be,"float":_1be};dojo.style=function(node,_1c0,_1c1){var n=byId(node),args=arguments.length,op=(_1c0=="opacity");_1c0=_1bf[_1c0]||_1c0;if(args==3){return op?d._setOpacity(n,_1c1):n.style[_1c0]=_1c1;}if(args==2&&op){return d._getOpacity(n);}var s=gcs(n);if(args==2&&typeof _1c0!="string"){for(var x in _1c0){d.style(node,x,_1c0[x]);}return s;}return (args==1)?s:_1bc(n,_1c0,s[_1c0]||n.style[_1c0]);};dojo._getPadExtents=function(n,_1c2){var s=_1c2||gcs(n),l=px(n,s.paddingLeft),t=px(n,s.paddingTop);return {l:l,t:t,w:l+px(n,s.paddingRight),h:t+px(n,s.paddingBottom)};};dojo._getBorderExtents=function(n,_1c3){var ne="none",s=_1c3||gcs(n),bl=(s.borderLeftStyle!=ne?px(n,s.borderLeftWidth):0),bt=(s.borderTopStyle!=ne?px(n,s.borderTopWidth):0);return {l:bl,t:bt,w:bl+(s.borderRightStyle!=ne?px(n,s.borderRightWidth):0),h:bt+(s.borderBottomStyle!=ne?px(n,s.borderBottomWidth):0)};};dojo._getPadBorderExtents=function(n,_1c4){var s=_1c4||gcs(n),p=d._getPadExtents(n,s),b=d._getBorderExtents(n,s);return {l:p.l+b.l,t:p.t+b.t,w:p.w+b.w,h:p.h+b.h};};dojo._getMarginExtents=function(n,_1c5){var s=_1c5||gcs(n),l=px(n,s.marginLeft),t=px(n,s.marginTop),r=px(n,s.marginRight),b=px(n,s.marginBottom);if(d.isWebKit&&(s.position!="absolute")){r=l;}return {l:l,t:t,w:l+r,h:t+b};};dojo._getMarginBox=function(node,_1c6){var s=_1c6||gcs(node),me=d._getMarginExtents(node,s);var l=node.offsetLeft-me.l,t=node.offsetTop-me.t,p=node.parentNode;if(d.isMoz){var sl=parseFloat(s.left),st=parseFloat(s.top);if(!isNaN(sl)&&!isNaN(st)){l=sl,t=st;}else{if(p&&p.style){var pcs=gcs(p);if(pcs.overflow!="visible"){var be=d._getBorderExtents(p,pcs);l+=be.l,t+=be.t;}}}}else{if(d.isOpera||(d.isIE>7&&!d.isQuirks)){if(p){be=d._getBorderExtents(p);l-=be.l;t-=be.t;}}}return {l:l,t:t,w:node.offsetWidth+me.w,h:node.offsetHeight+me.h};};dojo._getContentBox=function(node,_1c7){var s=_1c7||gcs(node),pe=d._getPadExtents(node,s),be=d._getBorderExtents(node,s),w=node.clientWidth,h;if(!w){w=node.offsetWidth,h=node.offsetHeight;}else{h=node.clientHeight,be.w=be.h=0;}if(d.isOpera){pe.l+=be.l;pe.t+=be.t;}return {l:pe.l,t:pe.t,w:w-pe.w-be.w,h:h-pe.h-be.h};};dojo._getBorderBox=function(node,_1c8){var s=_1c8||gcs(node),pe=d._getPadExtents(node,s),cb=d._getContentBox(node,s);return {l:cb.l-pe.l,t:cb.t-pe.t,w:cb.w+pe.w,h:cb.h+pe.h};};dojo._setBox=function(node,l,t,w,h,u){u=u||"px";var s=node.style;if(!isNaN(l)){s.left=l+u;}if(!isNaN(t)){s.top=t+u;}if(w>=0){s.width=w+u;}if(h>=0){s.height=h+u;}};dojo._isButtonTag=function(node){return node.tagName=="BUTTON"||node.tagName=="INPUT"&&(node.getAttribute("type")||"").toUpperCase()=="BUTTON";};dojo._usesBorderBox=function(node){var n=node.tagName;return d.boxModel=="border-box"||n=="TABLE"||d._isButtonTag(node);};dojo._setContentSize=function(node,_1c9,_1ca,_1cb){if(d._usesBorderBox(node)){var pb=d._getPadBorderExtents(node,_1cb);if(_1c9>=0){_1c9+=pb.w;}if(_1ca>=0){_1ca+=pb.h;}}d._setBox(node,NaN,NaN,_1c9,_1ca);};dojo._setMarginBox=function(node,_1cc,_1cd,_1ce,_1cf,_1d0){var s=_1d0||gcs(node),bb=d._usesBorderBox(node),pb=bb?_1d1:d._getPadBorderExtents(node,s);if(d.isWebKit){if(d._isButtonTag(node)){var ns=node.style;if(_1ce>=0&&!ns.width){ns.width="4px";}if(_1cf>=0&&!ns.height){ns.height="4px";}}}var mb=d._getMarginExtents(node,s);if(_1ce>=0){_1ce=Math.max(_1ce-pb.w-mb.w,0);}if(_1cf>=0){_1cf=Math.max(_1cf-pb.h-mb.h,0);}d._setBox(node,_1cc,_1cd,_1ce,_1cf);};var _1d1={l:0,t:0,w:0,h:0};dojo.marginBox=function(node,box){var n=byId(node),s=gcs(n),b=box;return !b?d._getMarginBox(n,s):d._setMarginBox(n,b.l,b.t,b.w,b.h,s);};dojo.contentBox=function(node,box){var n=byId(node),s=gcs(n),b=box;return !b?d._getContentBox(n,s):d._setContentSize(n,b.w,b.h,s);};var _1d2=function(node,prop){if(!(node=(node||0).parentNode)){return 0;}var val,_1d3=0,_1d4=d.body();while(node&&node.style){if(gcs(node).position=="fixed"){return 0;}val=node[prop];if(val){_1d3+=val-0;if(node==_1d4){break;}}node=node.parentNode;}return _1d3;};dojo._docScroll=function(){var n=d.global;return "pageXOffset" in n?{x:n.pageXOffset,y:n.pageYOffset}:(n=d.doc.documentElement,n.clientHeight?{x:d._fixIeBiDiScrollLeft(n.scrollLeft),y:n.scrollTop}:(n=d.body(),{x:n.scrollLeft||0,y:n.scrollTop||0}));};dojo._isBodyLtr=function(){return "_bodyLtr" in d?d._bodyLtr:d._bodyLtr=(d.body().dir||d.doc.documentElement.dir||"ltr").toLowerCase()=="ltr";};dojo._getIeDocumentElementOffset=function(){var de=d.doc.documentElement;if(d.isIE<8){var r=de.getBoundingClientRect();var l=r.left,t=r.top;if(d.isIE<7){l+=de.clientLeft;t+=de.clientTop;}return {x:l<0?0:l,y:t<0?0:t};}else{return {x:0,y:0};}};dojo._fixIeBiDiScrollLeft=function(_1d5){var dd=d.doc;if(d.isIE<8&&!d._isBodyLtr()){var de=d.isQuirks?dd.body:dd.documentElement;return _1d5+de.clientWidth-de.scrollWidth;}return _1d5;};dojo._abs=dojo.position=function(node,_1d6){var db=d.body(),dh=db.parentNode,ret;node=byId(node);if(node["getBoundingClientRect"]){ret=node.getBoundingClientRect();ret={x:ret.left,y:ret.top,w:ret.right-ret.left,h:ret.bottom-ret.top};if(d.isIE){var _1d7=d._getIeDocumentElementOffset();ret.x-=_1d7.x+(d.isQuirks?db.clientLeft+db.offsetLeft:0);ret.y-=_1d7.y+(d.isQuirks?db.clientTop+db.offsetTop:0);}else{if(d.isFF==3){var cs=gcs(dh);ret.x-=px(dh,cs.marginLeft)+px(dh,cs.borderLeftWidth);ret.y-=px(dh,cs.marginTop)+px(dh,cs.borderTopWidth);}}}else{ret={x:0,y:0,w:node.offsetWidth,h:node.offsetHeight};if(node["offsetParent"]){ret.x-=_1d2(node,"scrollLeft");ret.y-=_1d2(node,"scrollTop");var _1d8=node;do{var n=_1d8.offsetLeft,t=_1d8.offsetTop;ret.x+=isNaN(n)?0:n;ret.y+=isNaN(t)?0:t;cs=gcs(_1d8);if(_1d8!=node){if(d.isMoz){ret.x+=2*px(_1d8,cs.borderLeftWidth);ret.y+=2*px(_1d8,cs.borderTopWidth);}else{ret.x+=px(_1d8,cs.borderLeftWidth);ret.y+=px(_1d8,cs.borderTopWidth);}}if(d.isMoz&&cs.position=="static"){var _1d9=_1d8.parentNode;while(_1d9!=_1d8.offsetParent){var pcs=gcs(_1d9);if(pcs.position=="static"){ret.x+=px(_1d8,pcs.borderLeftWidth);ret.y+=px(_1d8,pcs.borderTopWidth);}_1d9=_1d9.parentNode;}}_1d8=_1d8.offsetParent;}while((_1d8!=dh)&&_1d8);}else{if(node.x&&node.y){ret.x+=isNaN(node.x)?0:node.x;ret.y+=isNaN(node.y)?0:node.y;}}}if(_1d6){var _1da=d._docScroll();ret.x+=_1da.x;ret.y+=_1da.y;}return ret;};dojo.coords=function(node,_1db){var n=byId(node),s=gcs(n),mb=d._getMarginBox(n,s);var abs=d.position(n,_1db);mb.x=abs.x;mb.y=abs.y;return mb;};var _1dc={"class":"className","for":"htmlFor",tabindex:"tabIndex",readonly:"readOnly",colspan:"colSpan",frameborder:"frameBorder",rowspan:"rowSpan",valuetype:"valueType"},_1dd={classname:"class",htmlfor:"for",tabindex:"tabIndex",readonly:"readOnly"},_1de={innerHTML:1,className:1,htmlFor:d.isIE,value:1};var _1df=function(name){return _1dd[name.toLowerCase()]||name;};var _1e0=function(node,name){var attr=node.getAttributeNode&&node.getAttributeNode(name);return attr&&attr.specified;};dojo.hasAttr=function(node,name){var lc=name.toLowerCase();return _1de[_1dc[lc]||name]||_1e0(byId(node),_1dd[lc]||name);};var _1e1={},_1e2=0,_1e3=dojo._scopeName+"attrid",_1e4={col:1,colgroup:1,table:1,tbody:1,tfoot:1,thead:1,tr:1,title:1};dojo.attr=function(node,name,_1e5){node=byId(node);var args=arguments.length,prop;if(args==2&&typeof name!="string"){for(var x in name){d.attr(node,x,name[x]);}return node;}var lc=name.toLowerCase(),_1e6=_1dc[lc]||name,_1e7=_1de[_1e6],_1e8=_1dd[lc]||name;if(args==3){do{if(_1e6=="style"&&typeof _1e5!="string"){d.style(node,_1e5);break;}if(_1e6=="innerHTML"){if(d.isIE&&node.tagName.toLowerCase() in _1e4){d.empty(node);node.appendChild(d._toDom(_1e5,node.ownerDocument));}else{node[_1e6]=_1e5;}break;}if(d.isFunction(_1e5)){var _1e9=d.attr(node,_1e3);if(!_1e9){_1e9=_1e2++;d.attr(node,_1e3,_1e9);}if(!_1e1[_1e9]){_1e1[_1e9]={};}var h=_1e1[_1e9][_1e6];if(h){d.disconnect(h);}else{try{delete node[_1e6];}catch(e){}}_1e1[_1e9][_1e6]=d.connect(node,_1e6,_1e5);break;}if(_1e7||typeof _1e5=="boolean"){node[_1e6]=_1e5;break;}node.setAttribute(_1e8,_1e5);}while(false);return node;}_1e5=node[_1e6];if(_1e7&&typeof _1e5!="undefined"){return _1e5;}if(_1e6!="href"&&(typeof _1e5=="boolean"||d.isFunction(_1e5))){return _1e5;}return _1e0(node,_1e8)?node.getAttribute(_1e8):null;};dojo.removeAttr=function(node,name){byId(node).removeAttribute(_1df(name));};dojo.getNodeProp=function(node,name){node=byId(node);var lc=name.toLowerCase(),_1ea=_1dc[lc]||name;if((_1ea in node)&&_1ea!="href"){return node[_1ea];}var _1eb=_1dd[lc]||name;return _1e0(node,_1eb)?node.getAttribute(_1eb):null;};dojo.create=function(tag,_1ec,_1ed,pos){var doc=d.doc;if(_1ed){_1ed=byId(_1ed);doc=_1ed.ownerDocument;}if(typeof tag=="string"){tag=doc.createElement(tag);}if(_1ec){d.attr(tag,_1ec);}if(_1ed){d.place(tag,_1ed,pos);}return tag;};d.empty=d.isIE?function(node){node=byId(node);for(var c;c=node.lastChild;){d.destroy(c);}}:function(node){byId(node).innerHTML="";};var _1ee={option:["select"],tbody:["table"],thead:["table"],tfoot:["table"],tr:["table","tbody"],td:["table","tbody","tr"],th:["table","thead","tr"],legend:["fieldset"],caption:["table"],colgroup:["table"],col:["table","colgroup"],li:["ul"]},_1ef=/<\s*([\w\:]+)/,_1f0={},_1f1=0,_1f2="__"+d._scopeName+"ToDomId";for(var _1f3 in _1ee){var tw=_1ee[_1f3];tw.pre=_1f3=="option"?"<select multiple=\"multiple\">":"<"+tw.join("><")+">";tw.post="</"+tw.reverse().join("></")+">";}d._toDom=function(frag,doc){doc=doc||d.doc;var _1f4=doc[_1f2];if(!_1f4){doc[_1f2]=_1f4=++_1f1+"";_1f0[_1f4]=doc.createElement("div");}frag+="";var _1f5=frag.match(_1ef),tag=_1f5?_1f5[1].toLowerCase():"",_1f6=_1f0[_1f4],wrap,i,fc,df;if(_1f5&&_1ee[tag]){wrap=_1ee[tag];_1f6.innerHTML=wrap.pre+frag+wrap.post;for(i=wrap.length;i;--i){_1f6=_1f6.firstChild;}}else{_1f6.innerHTML=frag;}if(_1f6.childNodes.length==1){return _1f6.removeChild(_1f6.firstChild);}df=doc.createDocumentFragment();while(fc=_1f6.firstChild){df.appendChild(fc);}return df;};var _1f7="className";dojo.hasClass=function(node,_1f8){return ((" "+byId(node)[_1f7]+" ").indexOf(" "+_1f8+" ")>=0);};var _1f9=/\s+/,a1=[""],_1fa=function(s){if(typeof s=="string"||s instanceof String){if(s.indexOf(" ")<0){a1[0]=s;return a1;}else{return s.split(_1f9);}}return s||"";};dojo.addClass=function(node,_1fb){node=byId(node);_1fb=_1fa(_1fb);var cls=node[_1f7],_1fc;cls=cls?" "+cls+" ":" ";_1fc=cls.length;for(var i=0,len=_1fb.length,c;i<len;++i){c=_1fb[i];if(c&&cls.indexOf(" "+c+" ")<0){cls+=c+" ";}}if(_1fc<cls.length){node[_1f7]=cls.substr(1,cls.length-2);}};dojo.removeClass=function(node,_1fd){node=byId(node);var cls;if(_1fd!==undefined){_1fd=_1fa(_1fd);cls=" "+node[_1f7]+" ";for(var i=0,len=_1fd.length;i<len;++i){cls=cls.replace(" "+_1fd[i]+" "," ");}cls=d.trim(cls);}else{cls="";}if(node[_1f7]!=cls){node[_1f7]=cls;}};dojo.toggleClass=function(node,_1fe,_1ff){if(_1ff===undefined){_1ff=!d.hasClass(node,_1fe);}d[_1ff?"addClass":"removeClass"](node,_1fe);};})();}if(!dojo._hasResource["dojo._base.NodeList"]){dojo._hasResource["dojo._base.NodeList"]=true;dojo.provide("dojo._base.NodeList");(function(){var d=dojo;var ap=Array.prototype,aps=ap.slice,apc=ap.concat;var tnl=function(a,_200,_201){if(!a.sort){a=aps.call(a,0);}var ctor=_201||this._NodeListCtor||d._NodeListCtor;a.constructor=ctor;dojo._mixin(a,ctor.prototype);a._NodeListCtor=ctor;return _200?a._stash(_200):a;};var _202=function(f,a,o){a=[0].concat(aps.call(a,0));o=o||d.global;return function(node){a[0]=node;return f.apply(o,a);};};var _203=function(f,o){return function(){this.forEach(_202(f,arguments,o));return this;};};var _204=function(f,o){return function(){return this.map(_202(f,arguments,o));};};var _205=function(f,o){return function(){return this.filter(_202(f,arguments,o));};};var _206=function(f,g,o){return function(){var a=arguments,body=_202(f,a,o);if(g.call(o||d.global,a)){return this.map(body);}this.forEach(body);return this;};};var _207=function(a){return a.length==1&&(typeof a[0]=="string");};var _208=function(node){var p=node.parentNode;if(p){p.removeChild(node);}};dojo.NodeList=function(){return tnl(Array.apply(null,arguments));};d._NodeListCtor=d.NodeList;var nl=d.NodeList,nlp=nl.prototype;nl._wrap=nlp._wrap=tnl;nl._adaptAsMap=_204;nl._adaptAsForEach=_203;nl._adaptAsFilter=_205;nl._adaptWithCondition=_206;d.forEach(["slice","splice"],function(name){var f=ap[name];nlp[name]=function(){return this._wrap(f.apply(this,arguments),name=="slice"?this:null);};});d.forEach(["indexOf","lastIndexOf","every","some"],function(name){var f=d[name];nlp[name]=function(){return f.apply(d,[this].concat(aps.call(arguments,0)));};});d.forEach(["attr","style"],function(name){nlp[name]=_206(d[name],_207);});d.forEach(["connect","addClass","removeClass","toggleClass","empty","removeAttr"],function(name){nlp[name]=_203(d[name]);});dojo.extend(dojo.NodeList,{_normalize:function(_209,_20a){var _20b=_209.parse===true?true:false;if(typeof _209.template=="string"){var _20c=_209.templateFunc||(dojo.string&&dojo.string.substitute);_209=_20c?_20c(_209.template,_209):_209;}var type=(typeof _209);if(type=="string"||type=="number"){_209=dojo._toDom(_209,(_20a&&_20a.ownerDocument));if(_209.nodeType==11){_209=dojo._toArray(_209.childNodes);}else{_209=[_209];}}else{if(!dojo.isArrayLike(_209)){_209=[_209];}else{if(!dojo.isArray(_209)){_209=dojo._toArray(_209);}}}if(_20b){_209._runParse=true;}return _209;},_cloneNode:function(node){return node.cloneNode(true);},_place:function(ary,_20d,_20e,_20f){if(_20d.nodeType!=1&&_20e=="only"){return;}var _210=_20d,_211;var _212=ary.length;for(var i=_212-1;i>=0;i--){var node=(_20f?this._cloneNode(ary[i]):ary[i]);if(ary._runParse&&dojo.parser&&dojo.parser.parse){if(!_211){_211=_210.ownerDocument.createElement("div");}_211.appendChild(node);dojo.parser.parse(_211);node=_211.firstChild;while(_211.firstChild){_211.removeChild(_211.firstChild);}}if(i==_212-1){dojo.place(node,_210,_20e);}else{_210.parentNode.insertBefore(node,_210);}_210=node;}},_stash:function(_213){this._parent=_213;return this;},end:function(){if(this._parent){return this._parent;}else{return new this._NodeListCtor();}},concat:function(item){var t=d.isArray(this)?this:aps.call(this,0),m=d.map(arguments,function(a){return a&&!d.isArray(a)&&(typeof NodeList!="undefined"&&a.constructor===NodeList||a.constructor===this._NodeListCtor)?aps.call(a,0):a;});return this._wrap(apc.apply(t,m),this);},map:function(func,obj){return this._wrap(d.map(this,func,obj),this);},forEach:function(_214,_215){d.forEach(this,_214,_215);return this;},coords:_204(d.coords),position:_204(d.position),place:function(_216,_217){var item=d.query(_216)[0];return this.forEach(function(node){d.place(node,item,_217);});},orphan:function(_218){return (_218?d._filterQueryResult(this,_218):this).forEach(_208);},adopt:function(_219,_21a){return d.query(_219).place(this[0],_21a)._stash(this);},query:function(_21b){if(!_21b){return this;}var ret=this.map(function(node){return d.query(_21b,node).filter(function(_21c){return _21c!==undefined;});});return this._wrap(apc.apply([],ret),this);},filter:function(_21d){var a=arguments,_21e=this,_21f=0;if(typeof _21d=="string"){_21e=d._filterQueryResult(this,a[0]);if(a.length==1){return _21e._stash(this);}_21f=1;}return this._wrap(d.filter(_21e,a[_21f],a[_21f+1]),this);},addContent:function(_220,_221){_220=this._normalize(_220,this[0]);for(var i=0,node;node=this[i];i++){this._place(_220,node,_221,i>0);}return this;},instantiate:function(_222,_223){var c=d.isFunction(_222)?_222:d.getObject(_222);_223=_223||{};return this.forEach(function(node){new c(_223,node);});},at:function(){var t=new this._NodeListCtor();d.forEach(arguments,function(i){if(i<0){i=this.length+i;}if(this[i]){t.push(this[i]);}},this);return t._stash(this);}});nl.events=["blur","focus","change","click","error","keydown","keypress","keyup","load","mousedown","mouseenter","mouseleave","mousemove","mouseout","mouseover","mouseup","submit"];d.forEach(nl.events,function(evt){var _224="on"+evt;nlp[_224]=function(a,b){return this.connect(_224,a,b);};});})();}if(!dojo._hasResource["dojo._base.query"]){dojo._hasResource["dojo._base.query"]=true;if(typeof dojo!="undefined"){dojo.provide("dojo._base.query");}(function(d){var trim=d.trim;var each=d.forEach;var qlc=d._NodeListCtor=d.NodeList;var _225=function(){return d.doc;};var _226=((d.isWebKit||d.isMozilla)&&((_225().compatMode)=="BackCompat"));var _227=!!_225().firstChild["children"]?"children":"childNodes";var _228=">~+";var _229=false;var _22a=function(){return true;};var _22b=function(_22c){if(_228.indexOf(_22c.slice(-1))>=0){_22c+=" * ";}else{_22c+=" ";}var ts=function(s,e){return trim(_22c.slice(s,e));};var _22d=[];var _22e=-1,_22f=-1,_230=-1,_231=-1,_232=-1,inId=-1,_233=-1,lc="",cc="",_234;var x=0,ql=_22c.length,_235=null,_236=null;var _237=function(){if(_233>=0){var tv=(_233==x)?null:ts(_233,x);_235[(_228.indexOf(tv)<0)?"tag":"oper"]=tv;_233=-1;}};var _238=function(){if(inId>=0){_235.id=ts(inId,x).replace(/\\/g,"");inId=-1;}};var _239=function(){if(_232>=0){_235.classes.push(ts(_232+1,x).replace(/\\/g,""));_232=-1;}};var _23a=function(){_238();_237();_239();};var _23b=function(){_23a();if(_231>=0){_235.pseudos.push({name:ts(_231+1,x)});}_235.loops=(_235.pseudos.length||_235.attrs.length||_235.classes.length);_235.oquery=_235.query=ts(_234,x);_235.otag=_235.tag=(_235["oper"])?null:(_235.tag||"*");if(_235.tag){_235.tag=_235.tag.toUpperCase();}if(_22d.length&&(_22d[_22d.length-1].oper)){_235.infixOper=_22d.pop();_235.query=_235.infixOper.query+" "+_235.query;}_22d.push(_235);_235=null;};for(;lc=cc,cc=_22c.charAt(x),x<ql;x++){if(lc=="\\"){continue;}if(!_235){_234=x;_235={query:null,pseudos:[],attrs:[],classes:[],tag:null,oper:null,id:null,getTag:function(){return (_229)?this.otag:this.tag;}};_233=x;}if(_22e>=0){if(cc=="]"){if(!_236.attr){_236.attr=ts(_22e+1,x);}else{_236.matchFor=ts((_230||_22e+1),x);}var cmf=_236.matchFor;if(cmf){if((cmf.charAt(0)=="\"")||(cmf.charAt(0)=="'")){_236.matchFor=cmf.slice(1,-1);}}_235.attrs.push(_236);_236=null;_22e=_230=-1;}else{if(cc=="="){var _23c=("|~^$*".indexOf(lc)>=0)?lc:"";_236.type=_23c+cc;_236.attr=ts(_22e+1,x-_23c.length);_230=x+1;}}}else{if(_22f>=0){if(cc==")"){if(_231>=0){_236.value=ts(_22f+1,x);}_231=_22f=-1;}}else{if(cc=="#"){_23a();inId=x+1;}else{if(cc=="."){_23a();_232=x;}else{if(cc==":"){_23a();_231=x;}else{if(cc=="["){_23a();_22e=x;_236={};}else{if(cc=="("){if(_231>=0){_236={name:ts(_231+1,x),value:null};_235.pseudos.push(_236);}_22f=x;}else{if((cc==" ")&&(lc!=cc)){_23b();}}}}}}}}}return _22d;};var _23d=function(_23e,_23f){if(!_23e){return _23f;}if(!_23f){return _23e;}return function(){return _23e.apply(window,arguments)&&_23f.apply(window,arguments);};};var _240=function(i,arr){var r=arr||[];if(i){r.push(i);}return r;};var _241=function(n){return (1==n.nodeType);};var _242="";var _243=function(elem,attr){if(!elem){return _242;}if(attr=="class"){return elem.className||_242;}if(attr=="for"){return elem.htmlFor||_242;}if(attr=="style"){return elem.style.cssText||_242;}return (_229?elem.getAttribute(attr):elem.getAttribute(attr,2))||_242;};var _244={"*=":function(attr,_245){return function(elem){return (_243(elem,attr).indexOf(_245)>=0);};},"^=":function(attr,_246){return function(elem){return (_243(elem,attr).indexOf(_246)==0);};},"$=":function(attr,_247){var tval=" "+_247;return function(elem){var ea=" "+_243(elem,attr);return (ea.lastIndexOf(_247)==(ea.length-_247.length));};},"~=":function(attr,_248){var tval=" "+_248+" ";return function(elem){var ea=" "+_243(elem,attr)+" ";return (ea.indexOf(tval)>=0);};},"|=":function(attr,_249){var _24a=" "+_249+"-";return function(elem){var ea=" "+_243(elem,attr);return ((ea==_249)||(ea.indexOf(_24a)==0));};},"=":function(attr,_24b){return function(elem){return (_243(elem,attr)==_24b);};}};var _24c=(typeof _225().firstChild.nextElementSibling=="undefined");var _24d=!_24c?"nextElementSibling":"nextSibling";var _24e=!_24c?"previousElementSibling":"previousSibling";var _24f=(_24c?_241:_22a);var _250=function(node){while(node=node[_24e]){if(_24f(node)){return false;}}return true;};var _251=function(node){while(node=node[_24d]){if(_24f(node)){return false;}}return true;};var _252=function(node){var root=node.parentNode;var i=0,tret=root[_227],ci=(node["_i"]||-1),cl=(root["_l"]||-1);if(!tret){return -1;}var l=tret.length;if(cl==l&&ci>=0&&cl>=0){return ci;}root["_l"]=l;ci=-1;for(var te=root["firstElementChild"]||root["firstChild"];te;te=te[_24d]){if(_24f(te)){te["_i"]=++i;if(node===te){ci=i;}}}return ci;};var _253=function(elem){return !((_252(elem))%2);};var _254=function(elem){return ((_252(elem))%2);};var _255={"checked":function(name,_256){return function(elem){return !!("checked" in elem?elem.checked:elem.selected);};},"first-child":function(){return _250;},"last-child":function(){return _251;},"only-child":function(name,_257){return function(node){if(!_250(node)){return false;}if(!_251(node)){return false;}return true;};},"empty":function(name,_258){return function(elem){var cn=elem.childNodes;var cnl=elem.childNodes.length;for(var x=cnl-1;x>=0;x--){var nt=cn[x].nodeType;if((nt===1)||(nt==3)){return false;}}return true;};},"contains":function(name,_259){var cz=_259.charAt(0);if(cz=="\""||cz=="'"){_259=_259.slice(1,-1);}return function(elem){return (elem.innerHTML.indexOf(_259)>=0);};},"not":function(name,_25a){var p=_22b(_25a)[0];var _25b={el:1};if(p.tag!="*"){_25b.tag=1;}if(!p.classes.length){_25b.classes=1;}var ntf=_25c(p,_25b);return function(elem){return (!ntf(elem));};},"nth-child":function(name,_25d){var pi=parseInt;if(_25d=="odd"){return _254;}else{if(_25d=="even"){return _253;}}if(_25d.indexOf("n")!=-1){var _25e=_25d.split("n",2);var pred=_25e[0]?((_25e[0]=="-")?-1:pi(_25e[0])):1;var idx=_25e[1]?pi(_25e[1]):0;var lb=0,ub=-1;if(pred>0){if(idx<0){idx=(idx%pred)&&(pred+(idx%pred));}else{if(idx>0){if(idx>=pred){lb=idx-idx%pred;}idx=idx%pred;}}}else{if(pred<0){pred*=-1;if(idx>0){ub=idx;idx=idx%pred;}}}if(pred>0){return function(elem){var i=_252(elem);return (i>=lb)&&(ub<0||i<=ub)&&((i%pred)==idx);};}else{_25d=idx;}}var _25f=pi(_25d);return function(elem){return (_252(elem)==_25f);};}};var _260=(d.isIE)?function(cond){var clc=cond.toLowerCase();if(clc=="class"){cond="className";}return function(elem){return (_229?elem.getAttribute(cond):elem[cond]||elem[clc]);};}:function(cond){return function(elem){return (elem&&elem.getAttribute&&elem.hasAttribute(cond));};};var _25c=function(_261,_262){if(!_261){return _22a;}_262=_262||{};var ff=null;if(!("el" in _262)){ff=_23d(ff,_241);}if(!("tag" in _262)){if(_261.tag!="*"){ff=_23d(ff,function(elem){return (elem&&(elem.tagName==_261.getTag()));});}}if(!("classes" in _262)){each(_261.classes,function(_263,idx,arr){var re=new RegExp("(?:^|\\s)"+_263+"(?:\\s|$)");ff=_23d(ff,function(elem){return re.test(elem.className);});ff.count=idx;});}if(!("pseudos" in _262)){each(_261.pseudos,function(_264){var pn=_264.name;if(_255[pn]){ff=_23d(ff,_255[pn](pn,_264.value));}});}if(!("attrs" in _262)){each(_261.attrs,function(attr){var _265;var a=attr.attr;if(attr.type&&_244[attr.type]){_265=_244[attr.type](a,attr.matchFor);}else{if(a.length){_265=_260(a);}}if(_265){ff=_23d(ff,_265);}});}if(!("id" in _262)){if(_261.id){ff=_23d(ff,function(elem){return (!!elem&&(elem.id==_261.id));});}}if(!ff){if(!("default" in _262)){ff=_22a;}}return ff;};var _266=function(_267){return function(node,ret,bag){while(node=node[_24d]){if(_24c&&(!_241(node))){continue;}if((!bag||_268(node,bag))&&_267(node)){ret.push(node);}break;}return ret;};};var _269=function(_26a){return function(root,ret,bag){var te=root[_24d];while(te){if(_24f(te)){if(bag&&!_268(te,bag)){break;}if(_26a(te)){ret.push(te);}}te=te[_24d];}return ret;};};var _26b=function(_26c){_26c=_26c||_22a;return function(root,ret,bag){var te,x=0,tret=root[_227];while(te=tret[x++]){if(_24f(te)&&(!bag||_268(te,bag))&&(_26c(te,x))){ret.push(te);}}return ret;};};var _26d=function(node,root){var pn=node.parentNode;while(pn){if(pn==root){break;}pn=pn.parentNode;}return !!pn;};var _26e={};var _26f=function(_270){var _271=_26e[_270.query];if(_271){return _271;}var io=_270.infixOper;var oper=(io?io.oper:"");var _272=_25c(_270,{el:1});var qt=_270.tag;var _273=("*"==qt);var ecs=_225()["getElementsByClassName"];if(!oper){if(_270.id){_272=(!_270.loops&&_273)?_22a:_25c(_270,{el:1,id:1});_271=function(root,arr){var te=d.byId(_270.id,(root.ownerDocument||root));if(!te||!_272(te)){return;}if(9==root.nodeType){return _240(te,arr);}else{if(_26d(te,root)){return _240(te,arr);}}};}else{if(ecs&&/\{\s*\[native code\]\s*\}/.test(String(ecs))&&_270.classes.length&&!_226){_272=_25c(_270,{el:1,classes:1,id:1});var _274=_270.classes.join(" ");_271=function(root,arr,bag){var ret=_240(0,arr),te,x=0;var tret=root.getElementsByClassName(_274);while((te=tret[x++])){if(_272(te,root)&&_268(te,bag)){ret.push(te);}}return ret;};}else{if(!_273&&!_270.loops){_271=function(root,arr,bag){var ret=_240(0,arr),te,x=0;var tret=root.getElementsByTagName(_270.getTag());while((te=tret[x++])){if(_268(te,bag)){ret.push(te);}}return ret;};}else{_272=_25c(_270,{el:1,tag:1,id:1});_271=function(root,arr,bag){var ret=_240(0,arr),te,x=0;var tret=root.getElementsByTagName(_270.getTag());while((te=tret[x++])){if(_272(te,root)&&_268(te,bag)){ret.push(te);}}return ret;};}}}}else{var _275={el:1};if(_273){_275.tag=1;}_272=_25c(_270,_275);if("+"==oper){_271=_266(_272);}else{if("~"==oper){_271=_269(_272);}else{if(">"==oper){_271=_26b(_272);}}}}return _26e[_270.query]=_271;};var _276=function(root,_277){var _278=_240(root),qp,x,te,qpl=_277.length,bag,ret;for(var i=0;i<qpl;i++){ret=[];qp=_277[i];x=_278.length-1;if(x>0){bag={};ret.nozip=true;}var gef=_26f(qp);for(var j=0;(te=_278[j]);j++){gef(te,ret,bag);}if(!ret.length){break;}_278=ret;}return ret;};var _279={},_27a={};var _27b=function(_27c){var _27d=_22b(trim(_27c));if(_27d.length==1){var tef=_26f(_27d[0]);return function(root){var r=tef(root,new qlc());if(r){r.nozip=true;}return r;};}return function(root){return _276(root,_27d);};};var nua=navigator.userAgent;var wk="WebKit/";var _27e=(d.isWebKit&&(nua.indexOf(wk)>0)&&(parseFloat(nua.split(wk)[1])>528));var _27f=d.isIE?"commentStrip":"nozip";var qsa="querySelectorAll";var _280=(!!_225()[qsa]&&(!d.isSafari||(d.isSafari>3.1)||_27e));var _281=/n\+\d|([^ ])?([>~+])([^ =])?/g;var _282=function(_283,pre,ch,post){return ch?(pre?pre+" ":"")+ch+(post?" "+post:""):_283;};var _284=function(_285,_286){_285=_285.replace(_281,_282);if(_280){var _287=_27a[_285];if(_287&&!_286){return _287;}}var _288=_279[_285];if(_288){return _288;}var qcz=_285.charAt(0);var _289=(-1==_285.indexOf(" "));if((_285.indexOf("#")>=0)&&(_289)){_286=true;}var _28a=(_280&&(!_286)&&(_228.indexOf(qcz)==-1)&&(!d.isIE||(_285.indexOf(":")==-1))&&(!(_226&&(_285.indexOf(".")>=0)))&&(_285.indexOf(":contains")==-1)&&(_285.indexOf(":checked")==-1)&&(_285.indexOf("|=")==-1));if(_28a){var tq=(_228.indexOf(_285.charAt(_285.length-1))>=0)?(_285+" *"):_285;return _27a[_285]=function(root){try{if(!((9==root.nodeType)||_289)){throw "";}var r=root[qsa](tq);r[_27f]=true;return r;}catch(e){return _284(_285,true)(root);}};}else{var _28b=_285.split(/\s*,\s*/);return _279[_285]=((_28b.length<2)?_27b(_285):function(root){var _28c=0,ret=[],tp;while((tp=_28b[_28c++])){ret=ret.concat(_27b(tp)(root));}return ret;});}};var _28d=0;var _28e=d.isIE?function(node){if(_229){return (node.getAttribute("_uid")||node.setAttribute("_uid",++_28d)||_28d);}else{return node.uniqueID;}}:function(node){return (node._uid||(node._uid=++_28d));};var _268=function(node,bag){if(!bag){return 1;}var id=_28e(node);if(!bag[id]){return bag[id]=1;}return 0;};var _28f="_zipIdx";var _290=function(arr){if(arr&&arr.nozip){return (qlc._wrap)?qlc._wrap(arr):arr;}var ret=new qlc();if(!arr||!arr.length){return ret;}if(arr[0]){ret.push(arr[0]);}if(arr.length<2){return ret;}_28d++;if(d.isIE&&_229){var _291=_28d+"";arr[0].setAttribute(_28f,_291);for(var x=1,te;te=arr[x];x++){if(arr[x].getAttribute(_28f)!=_291){ret.push(te);}te.setAttribute(_28f,_291);}}else{if(d.isIE&&arr.commentStrip){try{for(var x=1,te;te=arr[x];x++){if(_241(te)){ret.push(te);}}}catch(e){}}else{if(arr[0]){arr[0][_28f]=_28d;}for(var x=1,te;te=arr[x];x++){if(arr[x][_28f]!=_28d){ret.push(te);}te[_28f]=_28d;}}}return ret;};d.query=function(_292,root){qlc=d._NodeListCtor;if(!_292){return new qlc();}if(_292.constructor==qlc){return _292;}if(typeof _292!="string"){return new qlc(_292);}if(typeof root=="string"){root=d.byId(root);if(!root){return new qlc();}}root=root||_225();var od=root.ownerDocument||root.documentElement;_229=(root.contentType&&root.contentType=="application/xml")||(d.isOpera&&(root.doctype||od.toString()=="[object XMLDocument]"))||(!!od)&&(d.isIE?od.xml:(root.xmlVersion||od.xmlVersion));var r=_284(_292)(root);if(r&&r.nozip&&!qlc._wrap){return r;}return _290(r);};d.query.pseudos=_255;d._filterQueryResult=function(_293,_294){var _295=new d._NodeListCtor();var _296=_25c(_22b(_294)[0]);for(var x=0,te;te=_293[x];x++){if(_296(te)){_295.push(te);}}return _295;};})(this["queryPortability"]||this["acme"]||dojo);}if(!dojo._hasResource["dojo._base.xhr"]){dojo._hasResource["dojo._base.xhr"]=true;dojo.provide("dojo._base.xhr");(function(){var _297=dojo,cfg=_297.config;function _298(obj,name,_299){if(_299===null){return;}var val=obj[name];if(typeof val=="string"){obj[name]=[val,_299];}else{if(_297.isArray(val)){val.push(_299);}else{obj[name]=_299;}}};dojo.fieldToObject=function(_29a){var ret=null;var item=_297.byId(_29a);if(item){var _29b=item.name;var type=(item.type||"").toLowerCase();if(_29b&&type&&!item.disabled){if(type=="radio"||type=="checkbox"){if(item.checked){ret=item.value;}}else{if(item.multiple){ret=[];_297.query("option",item).forEach(function(opt){if(opt.selected){ret.push(opt.value);}});}else{ret=item.value;}}}}return ret;};dojo.formToObject=function(_29c){var ret={};var _29d="file|submit|image|reset|button|";_297.forEach(dojo.byId(_29c).elements,function(item){var _29e=item.name;var type=(item.type||"").toLowerCase();if(_29e&&type&&_29d.indexOf(type)==-1&&!item.disabled){_298(ret,_29e,_297.fieldToObject(item));if(type=="image"){ret[_29e+".x"]=ret[_29e+".y"]=ret[_29e].x=ret[_29e].y=0;}}});return ret;};dojo.objectToQuery=function(map){var enc=encodeURIComponent;var _29f=[];var _2a0={};for(var name in map){var _2a1=map[name];if(_2a1!=_2a0[name]){var _2a2=enc(name)+"=";if(_297.isArray(_2a1)){for(var i=0;i<_2a1.length;i++){_29f.push(_2a2+enc(_2a1[i]));}}else{_29f.push(_2a2+enc(_2a1));}}}return _29f.join("&");};dojo.formToQuery=function(_2a3){return _297.objectToQuery(_297.formToObject(_2a3));};dojo.formToJson=function(_2a4,_2a5){return _297.toJson(_297.formToObject(_2a4),_2a5);};dojo.queryToObject=function(str){var ret={};var qp=str.split("&");var dec=decodeURIComponent;_297.forEach(qp,function(item){if(item.length){var _2a6=item.split("=");var name=dec(_2a6.shift());var val=dec(_2a6.join("="));if(typeof ret[name]=="string"){ret[name]=[ret[name]];}if(_297.isArray(ret[name])){ret[name].push(val);}else{ret[name]=val;}}});return ret;};dojo._blockAsync=false;var _2a7=_297._contentHandlers=dojo.contentHandlers={text:function(xhr){return xhr.responseText;},json:function(xhr){return _297.fromJson(xhr.responseText||null);},"json-comment-filtered":function(xhr){if(!dojo.config.useCommentedJson){console.warn("Consider using the standard mimetype:application/json."+" json-commenting can introduce security issues. To"+" decrease the chances of hijacking, use the standard the 'json' handler and"+" prefix your json with: {}&&\n"+"Use djConfig.useCommentedJson=true to turn off this message.");}var _2a8=xhr.responseText;var _2a9=_2a8.indexOf("/*");var _2aa=_2a8.lastIndexOf("*/");if(_2a9==-1||_2aa==-1){throw new Error("JSON was not comment filtered");}return _297.fromJson(_2a8.substring(_2a9+2,_2aa));},javascript:function(xhr){return _297.eval(xhr.responseText);},xml:function(xhr){var _2ab=xhr.responseXML;if(_297.isIE&&(!_2ab||!_2ab.documentElement)){var ms=function(n){return "MSXML"+n+".DOMDocument";};var dp=["Microsoft.XMLDOM",ms(6),ms(4),ms(3),ms(2)];_297.some(dp,function(p){try{var dom=new ActiveXObject(p);dom.async=false;dom.loadXML(xhr.responseText);_2ab=dom;}catch(e){return false;}return true;});}return _2ab;},"json-comment-optional":function(xhr){if(xhr.responseText&&/^[^{\[]*\/\*/.test(xhr.responseText)){return _2a7["json-comment-filtered"](xhr);}else{return _2a7["json"](xhr);}}};dojo._ioSetArgs=function(args,_2ac,_2ad,_2ae){var _2af={args:args,url:args.url};var _2b0=null;if(args.form){var form=_297.byId(args.form);var _2b1=form.getAttributeNode("action");_2af.url=_2af.url||(_2b1?_2b1.value:null);_2b0=_297.formToObject(form);}var _2b2=[{}];if(_2b0){_2b2.push(_2b0);}if(args.content){_2b2.push(args.content);}if(args.preventCache){_2b2.push({"dojo.preventCache":new Date().valueOf()});}_2af.query=_297.objectToQuery(_297.mixin.apply(null,_2b2));_2af.handleAs=args.handleAs||"text";var d=new _297.Deferred(_2ac);d.addCallbacks(_2ad,function(_2b3){return _2ae(_2b3,d);});var ld=args.load;if(ld&&_297.isFunction(ld)){d.addCallback(function(_2b4){return ld.call(args,_2b4,_2af);});}var err=args.error;if(err&&_297.isFunction(err)){d.addErrback(function(_2b5){return err.call(args,_2b5,_2af);});}var _2b6=args.handle;if(_2b6&&_297.isFunction(_2b6)){d.addBoth(function(_2b7){return _2b6.call(args,_2b7,_2af);});}if(cfg.ioPublish&&_297.publish&&_2af.args.ioPublish!==false){d.addCallbacks(function(res){_297.publish("/dojo/io/load",[d,res]);return res;},function(res){_297.publish("/dojo/io/error",[d,res]);return res;});d.addBoth(function(res){_297.publish("/dojo/io/done",[d,res]);return res;});}d.ioArgs=_2af;return d;};var _2b8=function(dfd){dfd.canceled=true;var xhr=dfd.ioArgs.xhr;var _2b9=typeof xhr.abort;if(_2b9=="function"||_2b9=="object"||_2b9=="unknown"){xhr.abort();}var err=dfd.ioArgs.error;if(!err){err=new Error("xhr cancelled");err.dojoType="cancel";}return err;};var _2ba=function(dfd){var ret=_2a7[dfd.ioArgs.handleAs](dfd.ioArgs.xhr);return ret===undefined?null:ret;};var _2bb=function(_2bc,dfd){if(!dfd.ioArgs.args.failOk){console.error(_2bc);}return _2bc;};var _2bd=null;var _2be=[];var _2bf=0;var _2c0=function(dfd){if(_2bf<=0){_2bf=0;if(cfg.ioPublish&&_297.publish&&(!dfd||dfd&&dfd.ioArgs.args.ioPublish!==false)){_297.publish("/dojo/io/stop");}}};var _2c1=function(){var now=(new Date()).getTime();if(!_297._blockAsync){for(var i=0,tif;i<_2be.length&&(tif=_2be[i]);i++){var dfd=tif.dfd;var func=function(){if(!dfd||dfd.canceled||!tif.validCheck(dfd)){_2be.splice(i--,1);_2bf-=1;}else{if(tif.ioCheck(dfd)){_2be.splice(i--,1);tif.resHandle(dfd);_2bf-=1;}else{if(dfd.startTime){if(dfd.startTime+(dfd.ioArgs.args.timeout||0)<now){_2be.splice(i--,1);var err=new Error("timeout exceeded");err.dojoType="timeout";dfd.errback(err);dfd.cancel();_2bf-=1;}}}}};if(dojo.config.debugAtAllCosts){func.call(this);}else{try{func.call(this);}catch(e){dfd.errback(e);}}}}_2c0(dfd);if(!_2be.length){clearInterval(_2bd);_2bd=null;return;}};dojo._ioCancelAll=function(){try{_297.forEach(_2be,function(i){try{i.dfd.cancel();}catch(e){}});}catch(e){}};if(_297.isIE){_297.addOnWindowUnload(_297._ioCancelAll);}_297._ioNotifyStart=function(dfd){if(cfg.ioPublish&&_297.publish&&dfd.ioArgs.args.ioPublish!==false){if(!_2bf){_297.publish("/dojo/io/start");}_2bf+=1;_297.publish("/dojo/io/send",[dfd]);}};_297._ioWatch=function(dfd,_2c2,_2c3,_2c4){var args=dfd.ioArgs.args;if(args.timeout){dfd.startTime=(new Date()).getTime();}_2be.push({dfd:dfd,validCheck:_2c2,ioCheck:_2c3,resHandle:_2c4});if(!_2bd){_2bd=setInterval(_2c1,50);}if(args.sync){_2c1();}};var _2c5="application/x-www-form-urlencoded";var _2c6=function(dfd){return dfd.ioArgs.xhr.readyState;};var _2c7=function(dfd){return 4==dfd.ioArgs.xhr.readyState;};var _2c8=function(dfd){var xhr=dfd.ioArgs.xhr;if(_297._isDocumentOk(xhr)){dfd.callback(dfd);}else{var err=new Error("Unable to load "+dfd.ioArgs.url+" status:"+xhr.status);err.status=xhr.status;err.responseText=xhr.responseText;dfd.errback(err);}};dojo._ioAddQueryToUrl=function(_2c9){if(_2c9.query.length){_2c9.url+=(_2c9.url.indexOf("?")==-1?"?":"&")+_2c9.query;_2c9.query=null;}};dojo.xhr=function(_2ca,args,_2cb){var dfd=_297._ioSetArgs(args,_2b8,_2ba,_2bb);var _2cc=dfd.ioArgs;var xhr=_2cc.xhr=_297._xhrObj(_2cc.args);if(!xhr){dfd.cancel();return dfd;}if("postData" in args){_2cc.query=args.postData;}else{if("putData" in args){_2cc.query=args.putData;}else{if("rawBody" in args){_2cc.query=args.rawBody;}else{if((arguments.length>2&&!_2cb)||"POST|PUT".indexOf(_2ca.toUpperCase())==-1){_297._ioAddQueryToUrl(_2cc);}}}}xhr.open(_2ca,_2cc.url,args.sync!==true,args.user||undefined,args.password||undefined);if(args.headers){for(var hdr in args.headers){if(hdr.toLowerCase()==="content-type"&&!args.contentType){args.contentType=args.headers[hdr];}else{if(args.headers[hdr]){xhr.setRequestHeader(hdr,args.headers[hdr]);}}}}xhr.setRequestHeader("Content-Type",args.contentType||_2c5);if(!args.headers||!("X-Requested-With" in args.headers)){xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");}_297._ioNotifyStart(dfd);if(dojo.config.debugAtAllCosts){xhr.send(_2cc.query);}else{try{xhr.send(_2cc.query);}catch(e){_2cc.error=e;dfd.cancel();}}_297._ioWatch(dfd,_2c6,_2c7,_2c8);xhr=null;return dfd;};dojo.xhrGet=function(args){return _297.xhr("GET",args);};dojo.rawXhrPost=dojo.xhrPost=function(args){return _297.xhr("POST",args,true);};dojo.rawXhrPut=dojo.xhrPut=function(args){return _297.xhr("PUT",args,true);};dojo.xhrDelete=function(args){return _297.xhr("DELETE",args);};})();}if(!dojo._hasResource["dojo._base.fx"]){dojo._hasResource["dojo._base.fx"]=true;dojo.provide("dojo._base.fx");(function(){var d=dojo;var _2cd=d._mixin;dojo._Line=function(_2ce,end){this.start=_2ce;this.end=end;};dojo._Line.prototype.getValue=function(n){return ((this.end-this.start)*n)+this.start;};dojo.Animation=function(args){_2cd(this,args);if(d.isArray(this.curve)){this.curve=new d._Line(this.curve[0],this.curve[1]);}};d._Animation=d.Animation;d.extend(dojo.Animation,{duration:350,repeat:0,rate:20,_percent:0,_startRepeatCount:0,_getStep:function(){var _2cf=this._percent,_2d0=this.easing;return _2d0?_2d0(_2cf):_2cf;},_fire:function(evt,args){var a=args||[];if(this[evt]){if(d.config.debugAtAllCosts){this[evt].apply(this,a);}else{try{this[evt].apply(this,a);}catch(e){console.error("exception in animation handler for:",evt);console.error(e);}}}return this;},play:function(_2d1,_2d2){var _2d3=this;if(_2d3._delayTimer){_2d3._clearTimer();}if(_2d2){_2d3._stopTimer();_2d3._active=_2d3._paused=false;_2d3._percent=0;}else{if(_2d3._active&&!_2d3._paused){return _2d3;}}_2d3._fire("beforeBegin",[_2d3.node]);var de=_2d1||_2d3.delay,_2d4=dojo.hitch(_2d3,"_play",_2d2);if(de>0){_2d3._delayTimer=setTimeout(_2d4,de);return _2d3;}_2d4();return _2d3;},_play:function(_2d5){var _2d6=this;if(_2d6._delayTimer){_2d6._clearTimer();}_2d6._startTime=new Date().valueOf();if(_2d6._paused){_2d6._startTime-=_2d6.duration*_2d6._percent;}_2d6._active=true;_2d6._paused=false;var _2d7=_2d6.curve.getValue(_2d6._getStep());if(!_2d6._percent){if(!_2d6._startRepeatCount){_2d6._startRepeatCount=_2d6.repeat;}_2d6._fire("onBegin",[_2d7]);}_2d6._fire("onPlay",[_2d7]);_2d6._cycle();return _2d6;},pause:function(){var _2d8=this;if(_2d8._delayTimer){_2d8._clearTimer();}_2d8._stopTimer();if(!_2d8._active){return _2d8;}_2d8._paused=true;_2d8._fire("onPause",[_2d8.curve.getValue(_2d8._getStep())]);return _2d8;},gotoPercent:function(_2d9,_2da){var _2db=this;_2db._stopTimer();_2db._active=_2db._paused=true;_2db._percent=_2d9;if(_2da){_2db.play();}return _2db;},stop:function(_2dc){var _2dd=this;if(_2dd._delayTimer){_2dd._clearTimer();}if(!_2dd._timer){return _2dd;}_2dd._stopTimer();if(_2dc){_2dd._percent=1;}_2dd._fire("onStop",[_2dd.curve.getValue(_2dd._getStep())]);_2dd._active=_2dd._paused=false;return _2dd;},status:function(){if(this._active){return this._paused?"paused":"playing";}return "stopped";},_cycle:function(){var _2de=this;if(_2de._active){var curr=new Date().valueOf();var step=(curr-_2de._startTime)/(_2de.duration);if(step>=1){step=1;}_2de._percent=step;if(_2de.easing){step=_2de.easing(step);}_2de._fire("onAnimate",[_2de.curve.getValue(step)]);if(_2de._percent<1){_2de._startTimer();}else{_2de._active=false;if(_2de.repeat>0){_2de.repeat--;_2de.play(null,true);}else{if(_2de.repeat==-1){_2de.play(null,true);}else{if(_2de._startRepeatCount){_2de.repeat=_2de._startRepeatCount;_2de._startRepeatCount=0;}}}_2de._percent=0;_2de._fire("onEnd",[_2de.node]);!_2de.repeat&&_2de._stopTimer();}}return _2de;},_clearTimer:function(){clearTimeout(this._delayTimer);delete this._delayTimer;}});var ctr=0,_2df=null,_2e0={run:function(){}};d.extend(d.Animation,{_startTimer:function(){if(!this._timer){this._timer=d.connect(_2e0,"run",this,"_cycle");ctr++;}if(!_2df){_2df=setInterval(d.hitch(_2e0,"run"),this.rate);}},_stopTimer:function(){if(this._timer){d.disconnect(this._timer);this._timer=null;ctr--;}if(ctr<=0){clearInterval(_2df);_2df=null;ctr=0;}}});var _2e1=d.isIE?function(node){var ns=node.style;if(!ns.width.length&&d.style(node,"width")=="auto"){ns.width="auto";}}:function(){};dojo._fade=function(args){args.node=d.byId(args.node);var _2e2=_2cd({properties:{}},args),_2e3=(_2e2.properties.opacity={});_2e3.start=!("start" in _2e2)?function(){return +d.style(_2e2.node,"opacity")||0;}:_2e2.start;_2e3.end=_2e2.end;var anim=d.animateProperty(_2e2);d.connect(anim,"beforeBegin",d.partial(_2e1,_2e2.node));return anim;};dojo.fadeIn=function(args){return d._fade(_2cd({end:1},args));};dojo.fadeOut=function(args){return d._fade(_2cd({end:0},args));};dojo._defaultEasing=function(n){return 0.5+((Math.sin((n+1.5)*Math.PI))/2);};var _2e4=function(_2e5){this._properties=_2e5;for(var p in _2e5){var prop=_2e5[p];if(prop.start instanceof d.Color){prop.tempColor=new d.Color();}}};_2e4.prototype.getValue=function(r){var ret={};for(var p in this._properties){var prop=this._properties[p],_2e6=prop.start;if(_2e6 instanceof d.Color){ret[p]=d.blendColors(_2e6,prop.end,r,prop.tempColor).toCss();}else{if(!d.isArray(_2e6)){ret[p]=((prop.end-_2e6)*r)+_2e6+(p!="opacity"?prop.units||"px":0);}}}return ret;};dojo.animateProperty=function(args){var n=args.node=d.byId(args.node);if(!args.easing){args.easing=d._defaultEasing;}var anim=new d.Animation(args);d.connect(anim,"beforeBegin",anim,function(){var pm={};for(var p in this.properties){if(p=="width"||p=="height"){this.node.display="block";}var prop=this.properties[p];if(d.isFunction(prop)){prop=prop(n);}prop=pm[p]=_2cd({},(d.isObject(prop)?prop:{end:prop}));if(d.isFunction(prop.start)){prop.start=prop.start(n);}if(d.isFunction(prop.end)){prop.end=prop.end(n);}var _2e7=(p.toLowerCase().indexOf("color")>=0);function _2e8(node,p){var v={height:node.offsetHeight,width:node.offsetWidth}[p];if(v!==undefined){return v;}v=d.style(node,p);return (p=="opacity")?+v:(_2e7?v:parseFloat(v));};if(!("end" in prop)){prop.end=_2e8(n,p);}else{if(!("start" in prop)){prop.start=_2e8(n,p);}}if(_2e7){prop.start=new d.Color(prop.start);prop.end=new d.Color(prop.end);}else{prop.start=(p=="opacity")?+prop.start:parseFloat(prop.start);}}this.curve=new _2e4(pm);});d.connect(anim,"onAnimate",d.hitch(d,"style",anim.node));return anim;};dojo.anim=function(node,_2e9,_2ea,_2eb,_2ec,_2ed){return d.animateProperty({node:node,duration:_2ea||d.Animation.prototype.duration,properties:_2e9,easing:_2eb,onEnd:_2ec}).play(_2ed||0);};})();}if(!dojo._hasResource["dojo.i18n"]){dojo._hasResource["dojo.i18n"]=true;dojo.provide("dojo.i18n");dojo.i18n.getLocalization=function(_2ee,_2ef,_2f0){_2f0=dojo.i18n.normalizeLocale(_2f0);var _2f1=_2f0.split("-");var _2f2=[_2ee,"nls",_2ef].join(".");var _2f3=dojo._loadedModules[_2f2];if(_2f3){var _2f4;for(var i=_2f1.length;i>0;i--){var loc=_2f1.slice(0,i).join("_");if(_2f3[loc]){_2f4=_2f3[loc];break;}}if(!_2f4){_2f4=_2f3.ROOT;}if(_2f4){var _2f5=function(){};_2f5.prototype=_2f4;return new _2f5();}}throw new Error("Bundle not found: "+_2ef+" in "+_2ee+" , locale="+_2f0);};dojo.i18n.normalizeLocale=function(_2f6){var _2f7=_2f6?_2f6.toLowerCase():dojo.locale;if(_2f7=="root"){_2f7="ROOT";}return _2f7;};dojo.i18n._requireLocalization=function(_2f8,_2f9,_2fa,_2fb){var _2fc=dojo.i18n.normalizeLocale(_2fa);var _2fd=[_2f8,"nls",_2f9].join(".");var _2fe="";if(_2fb){var _2ff=_2fb.split(",");for(var i=0;i<_2ff.length;i++){if(_2fc["indexOf"](_2ff[i])==0){if(_2ff[i].length>_2fe.length){_2fe=_2ff[i];}}}if(!_2fe){_2fe="ROOT";}}var _300=_2fb?_2fe:_2fc;var _301=dojo._loadedModules[_2fd];var _302=null;if(_301){if(dojo.config.localizationComplete&&_301._built){return;}var _303=_300.replace(/-/g,"_");var _304=_2fd+"."+_303;_302=dojo._loadedModules[_304];}if(!_302){_301=dojo["provide"](_2fd);var syms=dojo._getModuleSymbols(_2f8);var _305=syms.concat("nls").join("/");var _306;dojo.i18n._searchLocalePath(_300,_2fb,function(loc){var _307=loc.replace(/-/g,"_");var _308=_2fd+"."+_307;var _309=false;if(!dojo._loadedModules[_308]){dojo["provide"](_308);var _30a=[_305];if(loc!="ROOT"){_30a.push(loc);}_30a.push(_2f9);var _30b=_30a.join("/")+".js";_309=dojo._loadPath(_30b,null,function(hash){var _30c=function(){};_30c.prototype=_306;_301[_307]=new _30c();for(var j in hash){_301[_307][j]=hash[j];}});}else{_309=true;}if(_309&&_301[_307]){_306=_301[_307];}else{_301[_307]=_306;}if(_2fb){return true;}});}if(_2fb&&_2fc!=_2fe){_301[_2fc.replace(/-/g,"_")]=_301[_2fe.replace(/-/g,"_")];}};(function(){var _30d=dojo.config.extraLocale;if(_30d){if(!_30d instanceof Array){_30d=[_30d];}var req=dojo.i18n._requireLocalization;dojo.i18n._requireLocalization=function(m,b,_30e,_30f){req(m,b,_30e,_30f);if(_30e){return;}for(var i=0;i<_30d.length;i++){req(m,b,_30d[i],_30f);}};}})();dojo.i18n._searchLocalePath=function(_310,down,_311){_310=dojo.i18n.normalizeLocale(_310);var _312=_310.split("-");var _313=[];for(var i=_312.length;i>0;i--){_313.push(_312.slice(0,i).join("-"));}_313.push(false);if(down){_313.reverse();}for(var j=_313.length-1;j>=0;j--){var loc=_313[j]||"ROOT";var stop=_311(loc);if(stop){break;}}};dojo.i18n._preloadLocalizations=function(_314,_315){function _316(_317){_317=dojo.i18n.normalizeLocale(_317);dojo.i18n._searchLocalePath(_317,true,function(loc){for(var i=0;i<_315.length;i++){if(_315[i]==loc){dojo["require"](_314+"_"+loc);return true;}}return false;});};_316();var _318=dojo.config.extraLocale||[];for(var i=0;i<_318.length;i++){_316(_318[i]);}};}if(!dojo._hasResource["dojo._base.browser"]){dojo._hasResource["dojo._base.browser"]=true;dojo.provide("dojo._base.browser");dojo.forEach(dojo.config.require,function(i){dojo["require"](i);});}if(dojo.isBrowser&&(document.readyState==="complete"||dojo.config.afterOnLoad)){window.setTimeout(dojo._loadInit,100);}})();


function citizensignup(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='4'><strong>Citizen Signups</strong></td></tr><tr><td align='center' style='valign:top'><button onclick=\"citizensignup(1)\">New Signup Requests</button></td><td align='center'><button onclick=\"citizensignup(2)\">Approved Requests</button></td><td align='center'><button onclick=\"citizensignup(3)\">Rejected Requests</button></td><td align='center' style='valign:top'><button onclick=\"citizensignup(4)\">All Signups</button></td></tr><tr><td colspan='4'><hr /></td></tr></table>";
  
  

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="citizensignup.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  

  xmlHttp.onreadystatechange=changed ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText; 

  } 

  }
  
   

function CreateXmlHttpObject()

  { 

  var objXMLHttp=null;

  if (window.XMLHttpRequest)

  {

  objXMLHttp=new XMLHttpRequest();

  }

  else if (window.ActiveXObject)

  {

  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP");

  }

  return objXMLHttp;

  }
 function viewsignup(str,from)
 {
 	
 	showsignup(str,from);
 }
 function showsignup(str,from)

  { 
 

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="citiform.jsp";

  url=url+"?q="+str;
  
  url=url+"&from="+from;

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed1 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed1() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  } 
  function showreason(str)
  {

  	document.getElementById("buttons").innerHTML="<form name=RegistrationForm><table width='100%'><tr><td valign='top'>Reason</td><td><textarea name='reason' ></textarea></td></tr><tr><td><button onclick=\"approve(2,"+str+",'reason')\">Submit</button></td><td><button onclick='showbuttons("+str+")'>Cancel</button></td></tr></table></form>";
  }
  function showbuttons(str)
  {
  
  document.getElementById("buttons").innerHTML="<button onclick=\"approve(1,"+str+",'notapplicable')\">Approve</button><button onclick=\"javascript:showreason("+str+")\">Reject</button>";
  }
  
  
  function approve(app,user,an)

  { 
 
  var reason=null;
  if(app==2)
  {
  reason=document.RegistrationForm.reason.value;;
  }
  else if(app==1)
  {
  reason='Not Applicable';
  }
document.getElementById("buttons").innerHTML="Loading";
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="allowciti.jsp";
  


  url=url+"?q="+app ;
 
  url=url+"&user="+user;

  url=url+"&reason="+reason;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed2 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed2() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	//document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td align='center'><button>New</button></td><td align='center'><button>Approved</button></td><td align='center'><button>Rejected</button></td><td align='center'><button>All</button><br/><br/></td></tr></table>";
    document.getElementById("buttons").innerHTML=xmlHttp.responseText;

  } 

  }
  
  function detectivesignup(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='5'>Detective Signups</td></tr><tr><td align='center'><button onclick=\"detectivesignup(1)\">New Signup Requests</button></td><td align='center'><button onclick=\"detectivesignup(2)\">Approved Requests</button></td><td align='center'><button onclick=\"detectivesignup(3)\">Rejected Requests</button></td><td align='center'><button onclick=\"detectivesignup(5)\">Pending Requests</button></td><td align='center'><button onclick=\"detectivesignup(4)\">All Signups</button></td></tr><tr><td colspan='5'><hr/></td></tr></table>";
   // alert("New"+str)

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="detectivesignup.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed3;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed3() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  }
  function viewdetectivesignup(str,from)
 {
 	
 	showdetectivesignup(str,from);
 }
 function showdetectivesignup(q,from)

  { 
 
//alert(from);
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="detectivesigncheck.jsp";

  url=url+"?q="+q;
  
  url=url+"&from="+from;

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed4 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed4() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  } 
 function showdetectivereason(str,from)
  {
//alert(str)
//alert(from)
  	document.getElementById("buttons").innerHTML="<table width='100%'><tr><td valign='top'>Reason</td><td><textarea name='reason' ></textarea></td></tr><tr><td><button onclick=\"approvedetective(2,"+str+",'reason')\">Submit</button></td><td><button onclick=\"showdetectivebuttons("+str+","+from+")\">Cancel</button></td></tr></table>";
  }
  function showdetectivebuttons(str,from)
  {
//alert(str)
//alert(from)  
	
	

  	document.getElementById("buttons").innerHTML="<button onclick=\"approvedetective(1,"+str+",'notapplicable')\">Approve</button><button onclick=\"approvedetective(3,"+str+",'notapplicable')\">Pending</button><button onclick=\"javascript:showdetectivereason("+str+","+from+")\">Reject</button>";
  	
  	
  	
  	
  } 
  
  function approvedetective(app,user,reason)

  { 
  //alert(app)
  //alert(user)
  var reason1=null;
  if(app==2)
  {
  reason=document.RegistrationForm.reason.value;
  }
  else if(app==1)
  {
  reason='Not Applicable';
  }
   else if(app==5)
  {
  reason='Not Applicable for pending';
  }
document.getElementById("buttons").innerHTML="Loading";
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="allowdet.jsp";
  


  url=url+"?q="+app ;
 
  url=url+"&user="+user;

  url=url+"&reason="+reason;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed5 ;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed5() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	//document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td align='center'><button>New</button></td><td align='center'><button>Approved</button></td><td align='center'><button>Rejected</button></td><td align='center'><button>All</button><br/><br/></td></tr></table>";
    document.getElementById("buttons").innerHTML=xmlHttp.responseText;

  } 

  }
function complaints(str)

  { 
  
  document.getElementById("options").innerHTML="<table style='background:#f3f3f3' width='73%'><tr><td colspan='4'><strong>Complaints</strong></td></tr><tr><td align='center' style='valign:top'><button onclick=\"complaints(1)\">All Complaints</button></td><td align='center'><button onclick=\"complaints(2)\">Only Emergency Complaints</button></td><td align='center'><button onclick=\"complaints(3)\">Only Non Emergency Complaints</button></td></tr><tr><td colspan='4'><hr /></td></tr></table>";
  
    

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="complaints.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed6;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed6() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  }  
  function viewcomplaint(str,from)
 {
 	
 	showcomplaint(str,from);
 }
 function showcomplaint(str,from)

  { 
 
//alert(from);
  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="complaintsview.jsp";

  url=url+"?q="+str;
  
  url=url+"&from="+from;
  

  url=url+"&sid="+Math.random();

  xmlHttp.onreadystatechange=changed7;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed7() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  } 
  function loadfir(id,complaint)
  {

  	document.getElementById("buttons").innerHTML="  	<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"
+"			<tr>"
+"					<td colspan='4' align='center'><h3 style='display:inline'>First Information Report</h3></td>"
+"					</tr>"
+"		<tr><td colspan='4' align='center'>( under section 154 Cr.P.C)</td></tr>	"
+"			"	
+"				<tr>"
+"					"
+"		<td>Date of Occurrence:<span class='style3'>*</span></td>"
+""
+"		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>	"						
+"			</select> <select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='dateselDIV'>"
+"					<select name='date'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"		<td >Time of occurrence:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_occurance' maxlength='5' title='Please enter the time of occurance'/></td>"
+"		</tr>"
+"			"
+"				<tr>"
+"					<td style='width: 120px'>Date of reporting: <span class='style3'>*</span></td>"
+"							<td><select name='year1' onchange='listdate1(document.RegistrationForm.month1.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>"							
+"			</select> <select name='month1' onchange='listdate1(this.value,document.RegistrationForm.year1.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='datesel1DIV'>"
+"					<select name='date1'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"					<td>Time of reporting:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_report' maxlength='5' /><!-- current time --></td>"
+"				</tr>"
+"	<tr>"
+"		<td style='text-align: top' valign='top'>Crime Sections<span class='style3'>*</span></td>"
+"		<td colspan='3'><textarea name='crime_sections' title='Please enter the crimesections' cols='46' rows='5' ></textarea> Example 420,302</td>"
+"	</tr>"
+"	<tr>"
+"		<td style='text-align: top' valign='top'>Place of occurrence details:<span class='style3'>*</span></td>"
+"		<td colspan='3'><textarea name='occu_place' title='Please enter the place of occurance' cols='46' rows='5' ></textarea></td>"
+"	</tr>"
+"	<tr>"
+"	<td valign='top'>Details of Complaint<span class='style3'>*</span></td>"
+"	<td colspan='3'><textarea name='particulars' title='Please enter the particulars of stolen property' cols='46' rows='5'></textarea></td>"
+"	</tr>"
+"	<tr>"
+"	<td>Total value of the properties stolen:<span class='style3'>*</span></td>"
+"	<td colspan='3'><input type='text' name='totalvalue' maxlength='10' title='Please enter the particulars of stolen property' /></td>"
+"	</tr>"

+"	<tr class='colour'>"
+"		<td colspan='4'><b>Complainant Information</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>Name: <span class='style3'>*</span></td>"
+"		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainant's name'/></td>"
+"		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>"
+"		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the complainant's name' /></td>"
+"	</tr>"


+"	<tr>"
+"		<td>Nationality:<span class='style3'>*</span></td>"
+"		 <td><input type='text' name='nationality' maxlength='30' />     "
+"	</td>"
+"	<td>Occupation:<span class='style3'>*</span></td>"
+"		<td>"
+"			<input type='text' name='occupation' maxlength='150'/>"
+"		</td>		 "
+"	</tr>"

+"	<tr class='colour'>"
+"		<td colspan='4'><b>Suspect Information (if known)</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>FirstSuspect <span class='style3'>*</span></td>"
+"		<td><input type='text' name='first' maxlength='50'	title='Please enter the complainant's name'/></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>SecondSuspect <span class='style3'></span></td>"
+"		<td><input type='text' name='second' maxlength='50'	title='Please enter the complainant's name'/></td>"
+"	</tr>"



+"	<tr>"
+"		<td>FIR Summary:<span class='style3'>*</span></td>"
+"		<td colspan='2'><textarea name='firsummary' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
+"</table>"
+"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><div id='try' onclick=\"clickfir("+id+","+complaint+")\"><button >Add FIR</button></div></td>"
+"		<td></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  }
  
  function showfirbuttons()
  {
document.getElementById("buttons").innerHTML="<button onclick=\"loadfir()\">Make an FIR</button><button onclick=\"loadpettycase()\">Make Petty case</button><button onclick=\"loadnon()\">Non Cognizable</button> </span>";
  }
    function loadpettycase()
  {
  	document.getElementById("buttons").innerHTML="<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"
+"  				<tr>"
+"					<td colspan='4' align='center'><h3 style='display: inline'>Petty Case</h3></td>"
					
+"				</tr>"
			
				
+"				<tr>"
					
+"		<td>Date of Arrest <span class='style3'>*</span></td>"

+"		<td><select name='year' onchange='listdate(document.RegistrationForm.month.value,this.value)'>"
+"				<option value='0'>year</option>"
+"				<option value='2008'>2008</option>"
+"				<option value='2009'>2009</option>"
+"				<option value='2010'>2010</option>"
+"				<option value='2011'>2011</option>"
+"				<option value='2012'>2012</option>"
+"				<option value='2013'>2013</option>"
+"				<option value='2014'>2014</option>"
+"				<option value='2015'>2015</option>"
+"				<option value='2016'>2016</option>"
+"				<option value='2017'>2017</option>"
+"				<option value='2018'>2018</option>"
+"				<option value='2019'>2019</option>"
+"				<option value='2020'>2020</option>"
				
				
+"			</select> <select name='month' onchange='listdate(this.value,document.RegistrationForm.year.value)'>"
+"				<option value='0'>mon</option>"
+"				<option value='01'>jan</option>"
+"				<option value='02'>feb</option>"
+"				<option value='03'>mar</option>"
+"				<option value='04'>apr</option>"
+"				<option value='05'>may</option>"
+"				<option value='06'>jun</option>"
+"				<option value='07'>jul</option>"
+"				<option value='08'>aug</option>"
+"				<option value='09'>sep</option>"
+"				<option value='10'>oct</option>"
+"				<option value='11'>nov</option>"
+"				<option value='12'>dec</option>"
+"			</select> <span id='dateselDIV'>"
+"					<select name='date'>"
+"					<option>dd</option>"
+"					</select> </span> "
+"		</td>"
+"		<td>Time of arrest:<span class='style3'>*</span></td>"
+"					<td><input type='text' name='time_arrest' maxlength='5' title='Please enter the time of occurance'/></td>"
+"		</tr>"
			
+"	<tr class='colour'>"
+"		<td colspan='4'><b>Complainant Information</b></td>"
+"	</tr>"
+"	<tr>"
+"		<td style='width: 120px'>Name: <span class='style3'>*</span></td>"
+"		<td><input type='text' name='name' maxlength='50'			title='Please enter the complainants name'/></td>"

+"		<td>Son/Daughter/Husband of :<span class='style3'>*</span></td>"
+"		<td><input type='text' name='sdhname' maxlength='50' title='Please enter the father/husband name' /></td>"
+"	</tr>"

+"	<tr>"
+"		<td>Reason For Arrest<span class='style3'>*</span></td>"
+"		<td colspan='2'><textarea name='reason' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
	

+"</table>"
+"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><button onclick='submitpettycase()'>Submit</button></td>"
+"		<td><input type='reset' value='Reset'/></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  	}
function loadnon()
  {
  	document.getElementById("buttons").innerHTML="<table width='100%' cellspacing='5' cellpadding='5' class='back' style='text-align:left;vertical-align: top'>"  
+"<tr>		<td colspan='2' valign='top'>Do you want to enter any additional details</td>"
+"		<td colspan='2'><textarea name='reason' title='Please enter the summary of FIR' cols='46' rows='5'></textarea></td>	"
+"	</tr>"
	

+"</table>"
  +"<table width='97%' class='back' cellspacing='5' cellpadding='5'  style='text-align:center;vertical-align: top'>"
+"	<tr>"
+"		<td width='25%'>&nbsp;</td>"
+"		<td><button onclick='submitnon()'>Submit</button></td>"
+"		<td><input type='reset' value='Reset'/></td>"
+"		<td width='25%'><button onclick='showfirbuttons()'>cancel</button></td>		"
+"	</tr>"
+"	</table>";
  }

function submitpettycase()
{
document.getElementById("buttons").innerHTML="pettycase";
}

  function seeallfir(str)

  { 
  

  
    //alert("New"+str)

  xmlHttp=CreateXmlHttpObject();

  if (xmlHttp==null)

  {

  alert ("Browser does not support HTTP Request");

  return;

  } 

  var url="allfir.jsp";

  url=url+"?q="+str;

  url=url+"&sid="+Math.random();
  
  //alert(url)

  xmlHttp.onreadystatechange=changed8;

  xmlHttp.open("GET",url,true);

  xmlHttp.send(null);

  }

function changed8() 

  { 

  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

  { 
	
    document.getElementById("listall").innerHTML=xmlHttp.responseText ;

  } 

  }
 