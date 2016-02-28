class RankingController < ApplicationController
  
  # 持っているものの多い順のアイテムを上位10個表示
  def have
    @item_keys = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
    @type = "have"
    load_items
  end

  # 欲しいものの多い順のアイテムを上位10個表示
  def want
    @item_keys = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
    @type = "want"
    load_items
  end
  
  # item_idからitem情報を読みだす
  def load_items
    @items = Array.new
    @item_keys.each_with_index do |item_key,i|
      @items.append(Item.find(item_key))
    end
  end
end
