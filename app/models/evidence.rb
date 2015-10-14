class Evidence < ActiveRecord::Base
  has_attached_file :screenshot, styles: {
                                            thumb: 'x100',
                                            small: 'x200',
                                            medium: 'x400',
                                            big: 'x600'
                                          }

  belongs_to :card

  scope :unused, -> { where(card_id: nil) }
  scope :for, -> (id) { where(card_id: id) }

  validates_attachment_content_type :screenshot, content_type: /\Aimage\/.*\Z/
end
