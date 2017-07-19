class Admin::BreedingRecordsController < Admin::Base

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
	end

	def show
		@record = BreedingRecord.find_by(id: params[:id])
	end

	def new
		@record = BreedingRecord.new
	end

	def edit
		@record = BreedingRecord.find_by(id: params[:id])
	end

	def create
		@record = BreedingRecord.new
		@record.assign_attributes(record_params)

		if @record.save
			redirect_to [:admin, @record], notice: "記録を作成しました"
		else
			render "new"
		end
		
	end

	def update
		@record = BreedingRecord.find_by(id: params[:id])
		@record.assign_attributes(record_params)

		if @record.save
			redirect_to [:admin, @record], notice: "更新に成功しました"
		else
			render "edit"
		end
	end

	def destroy
		record = BreedingRecord.find(params[:id])
		record.destroy
		redirect_to :admin_breeding_records, notice: "レコードの削除に成功しました"
	end

	private
	def record_params
		allows = []
		allows = [ :feed, :weight, :height, :is_shed, :note, :photo_url, :date ] if current_user.administrator
		params.require(:breeding_record).permit(allows)
	end

end
