class CategoryController < ApplicationController

  def search
    q = "%#{params[:q].downcase}%"
    found = Category.enabled.where('LOWER(name) LIKE ?', q)

    results = []
    found.each do |f|
      result = Hash.new
      result['category'] = f.name
      result['ancestors_name'] = f.ancestors.pluck(:name).join(' / ')
      results << result
    end

    render json: {categories: results}, status: :ok

  end

  def list
    list = Category.list
    render json: {data: list}, status: :ok
  end

end
