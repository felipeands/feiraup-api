class Category < ActiveRecord::Base
  has_ancestry
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

end
