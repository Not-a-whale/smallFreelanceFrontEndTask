function PhotoBalloon(node)
{
    if( node.getAttribute('mime_type') !== null && node.getAttribute('mime_type').match(/image\/(png|jpeg)/i) ) {
        let file = node.getAttribute('fileid');
        let data = '<img alt="...loading image" src="/showimage.cgi?geom=80x80&db=tms&i='
                   + file
                   + '" style="max-width: 80px; max-height: 80px"/>';
        node.removeAttribute('mime_type');
        $(node).balloon({
              html: true,
              contents: data,
              css: { backgroundColor: '#fff' }
            });
    }
}
