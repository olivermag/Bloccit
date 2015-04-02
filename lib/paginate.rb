module Paginate

	public

	def paginate(params)
		page = params[:page].to_i
		rel = limit(10).offset(page * 30)
	end
end