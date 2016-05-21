class Category < ActiveRecord::Base
  has_ancestry

  # allow get "shops" from "category"
  has_many :shop_categories
  has_many :shops, through: :shop_categories, source: 'shop'

  enum status: { disabled: 0, enabled: 1 }

  def self.list_fields
    roots = self.roots
    results = []

    # generos
    roots.each do |r|

      genero = Hash.new
      genero[:id] = r.id
      genero[:name] = r.name
      genero[:status] = r.status

      # categorias
      genero[:categories] = []
      r.children.each do |c|

        # sub
        category = {}
        category[:id] = c.id
        category[:name] = c.name
        category[:status] = c.status

        category[:categories] = []
        c.children.each do |s|
          sub = {}
          sub[:id] = s.id
          sub[:name] = s.name
          sub[:status] = s.status
          category[:categories] << sub
        end

        genero[:categories] << category

      end

      results << genero
    end
  end

  def self.list
    self.arrange_serializable
  end

  def self.search(q)
    self.where('lower(name) LIKE ?', "%#{q.downcase}%")
  end

  def self.sub_categories(categories)
    sub = []
    categories.each do |cat|
      sub = sub | cat.descendant_ids
    end
    sub
  end

end
