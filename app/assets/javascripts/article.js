function blockhighlighting(block){
  if(block.className == "use_html"){
    hljs.highlightBlock(block);
  } else {
    block.innerHTML = escapeHtml(block.innerHTML);
    hljs.highlightBlock(block);
  }
}


//エスケープ処理
var escapeHtml = (function (String) {
  var escapeMap = {
    '&': '&amp;',
    "'": '&#x27;',
    '`': '&#x60;',
    '"': '&quot;',
    '<': '&lt;',
    '>': '&gt;'
  };
  var escapeReg = '[';
  var reg;
  for (var p in escapeMap) {
    if (escapeMap.hasOwnProperty(p)) {
      escapeReg += p;
    }
  }
  escapeReg += ']';
  reg = new RegExp(escapeReg, 'g');
 
  return function escapeHtml (str) {
    str = (str === null || str === undefined) ? '' : '' + str;
    return str.replace(reg, function (match) {
      return escapeMap[match];
    });
  };
}(String));