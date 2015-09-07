class GenericCarsDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: GenericCar.count,
      iTotalDisplayRecords: generic_cars.total_entries,
      aaData: data
    }
  end

private

  def data
    generic_cars.map do |car|
      [
        car.model_acronym.brand.name,
        car.model_acronym.model,
        car.formatted_year,
        car.code,
        car.car_type.full_name,
        link_to("Familias", Rails.application.routes.url_helpers.assignation_generic_car_path(car)),
        link_to("Ver",car),
        link_to("Editar", Rails.application.routes.url_helpers.edit_generic_car_path(car)),
      ]
    end
  end

  def generic_cars
    @generic_cars ||= fetch_generic_cars
  end

  def fetch_generic_cars
    generic_cars = GenericCar.includes(model_acronym: :brand).order("#{sort_column} #{sort_direction}")
    generic_cars = generic_cars.page(page).per_page(per_page)
    if params[:sSearch].present?
      generic_cars = generic_cars.where("model like :search", search: "%#{params[:sSearch].upcase}%")
    end
    generic_cars
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ model_acronyms.brand.name model_acronyms.model years generic_cars.code ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end