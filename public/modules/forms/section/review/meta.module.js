var meta_sectform_review_bindings = CloneObj(meta_sectform_bindings);
meta_sectform_review_bindings.onSubmit = '&?';
meta_sectform_review_bindings.onCancel = '&?';
app.component('metaReviewForm',{
  templateUrl: 'modules/forms/section/review/meta.template.html',
  bindings: meta_sectform_review_bindings
});