module CardsHelper
  def evidence_checkbox_label(evidence)
    link_to image_tag(evidence.screenshot.url(:thumb)),
      evidence.screenshot.url(:medium), class: 'img-preview'
  end
end
