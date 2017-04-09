module Api
	module V1
		class ProductsController < ApplicationController
			before_action :find_product, only: [:update, :destroy]
			skip_before_filter  :verify_authenticity_token

			def index
				products = Product.all
				render json: products
			end

			def create
			 	@product = Product.new(product_params)
			 	if @product.save
			 		render json: @product, status: :created
		 		else
		 			render json: @product.errors, status: :unprocessable_entity
		 		end
			end

			def update
				if @product.update(product_params)
					render json: @product, status: 200
				else
					render json: @product.errors, status: 422
				end
			end

			def destroy
				@product.destroy
				head :no_content
			end

			private

			def product_params
				params.require(:product).permit(:name, :price)
			end

			def find_product
				@product = Product.find(params[:id])
			end
		end

	end
end
