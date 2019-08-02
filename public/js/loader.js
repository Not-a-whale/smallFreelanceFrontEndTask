function getAlreadyDownloaded(){
    let scripts = document.scripts;
    let styles = document.styleSheets;
    let result = {};
    for (i = 0; i < scripts.length; i++){
        if (scripts[i].attributes.getNamedItem("src"))
            result[scripts[i].attributes.getNamedItem("src").value.replace(/.*\//, '')] = 1;
    }
    for (i = 0; i < styles.length; i++){
        if (styles[i].ownerNode.attributes.getNamedItem("href"))
            result[styles[i].ownerNode.attributes.getNamedItem("href").value.replace(/.*\//, '')] = 1;
    }
    return result;
}

function DL(filename)
{
    var LoadedFiles = getAlreadyDownloaded();
    var fileref = null;
    if( LoadedFiles[filename] ) return;
    LoadedFiles[filename] = 1;

    if( filename.match(/\.js$/)) {
        fileref=document.createElement('script');
        fileref.setAttribute("src", "/jsfiles/" + filename);
    }

    if( filename.match(/\.css$/)) {
        fileref=document.createElement("link");
        fileref.setAttribute("rel", "stylesheet");
        fileref.setAttribute("type", "text/css");
        fileref.setAttribute("href", "/css/" + filename);
    }
    document.getElementsByTagName("head")[0].appendChild(fileref);
}
