class Post < ActiveRecord::Base

  belongs_to :category

  has_many :post_taggings,
  :foreign_key => "post_id",
  :class_name => "Pt"

  has_many :post_authorings,
   :foreign_key => "post_id",
   :class_name => "Pu"

  has_many :authors,
  :through => :post_authorings,
  :source => :user,
  :dependent => :delete_all

  has_many :tags,
   :through => :post_taggings,
   :dependent => :destroy

  has_many :comments,
  :dependent => :destroy

end