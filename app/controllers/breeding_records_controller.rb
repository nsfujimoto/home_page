class BreedingRecordsController < ApplicationController
	
	def index
		if params[:year].present? && params[:month].present?
			@year = params[:year].to_i
			@month = params[:month].to_i
		else
			@year = Date.today.year
			@month = Date.today.month
		end

		@start_day = Date.new(@year, @month) - Date.new(@year, @month).wday
		@end_day = Date.new(@year, @month).end_of_month + (6 - Date.new(@year, @month).end_of_month.wday)
		@records = {}

		BreedingRecord.get_span(@start_day, @end_day).each do |record|
			@records[record.date.to_s] = record
		end

		render layout: false
	end

	def show
		@record = BreedingRecord.find_by(id: params[:id])
	end

end
