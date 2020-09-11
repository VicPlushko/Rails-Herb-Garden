class Remedy < ApplicationRecord
    belongs_to :user
    has_many :remedy_herbs, dependent: :destroy
    has_many :herbs, through: :remedy_herbs
    validates :title, :directions, presence: true
    validates :title, uniqueness: true
    accepts_nested_attributes_for :remedy_herbs

    # def remedy_herbs_attributes=(remedy_herb_attributes)
    #     remedy_herb_attributes.values.each do |attributes|
    #         if attributes["quantity"].present?
    #             remedy_herb = RemedyHerb.find_or_create_by(attributes)
    #             self.remedy_herbs << remedy_herb
    #         end
    #     end
    # end
end
