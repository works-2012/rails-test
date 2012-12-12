class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id

  validates :text, :presence => true,
                    :length => { :minimum => 10 }

  belongs_to :user
  belongs_to :post
  belongs_to :tag
end
