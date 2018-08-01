class Item < ApplicationRecord

  validates :price, {numericality: {greater_than: 0, allow_nil: true}} # 1-ые фигурные скобки не обязательны
  #validates :name, :description, presence: true
  validates :name, presence: true

  has_many  :positions
  has_many  :carts, through: :positions

  #belongs_to :category
  ##Колбэки(Специальные методы которые позволяют выполнять опредиленный код в ответ на события которые
  # произошли с нашей моделью )
  #after_initialize { } #{ puts "initialized" } #Item.new, Item.first
  #after_save       { } #{ puts"saved" } #Item.save; Item.create; item.update_attributes
  #after_create     { category.inc(:items_count, 1) }#{ ItemMailer.new_item_created(self).deliver }
  #after_update     { } #{ puts"updated" }
  #after_destroy    { category.inc(:items_count, -1) } #Item.destroy

end
