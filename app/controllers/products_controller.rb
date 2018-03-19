# encoding : utf-8


class ProductsController < BeautifulController

  before_action :load_product, :only => [:show, :edit, :update, :destroy]

  # Uncomment for check abilities with CanCan
  #authorize_resource

  def index
    session['fields'] ||= {}
    session['fields']['product'] ||= (Product.columns.map(&:name) - ["id"])[0..4]
    do_select_fields('product')
    do_sort_and_paginate('product')
    
    @q = Product.ransack(
      params[:q]
    )

    @product_scope = @q.result(
      :distinct => true
    ).sorting(
      params[:sorting]
    )
    
    @product_scope_for_scope = @product_scope.dup
    
    unless params[:scope].blank?
      @product_scope = @product_scope.send(params[:scope])
    end
    
    @products = @product_scope.paginate(
      :page => params[:page],
      :per_page => 20
    ).to_a

    respond_to do |format|
      format.html{
        render
      }
      format.json{
        render :json => @product_scope.to_a
      }
      format.csv{
        require 'csv'
        csvstr = CSV.generate do |csv|
          csv << Product.attribute_names
          @product_scope.to_a.each{ |o|
            csv << Product.attribute_names.map{ |a| o[a] }
          }
        end 
        render :text => csvstr
      }
      format.xml{ 
        render :xml => @product_scope.to_a
      }             
      format.pdf{
        pdfcontent = PdfReport.new.to_pdf(Product,@product_scope)
        send_data pdfcontent
      }
    end
  end

  def show
    respond_to do |format|
      format.html{
        render
      }
      format.json { render :json => @product }
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html{
        render
      }
      format.json { render :json => @product }
    end
  end

  def edit
    
  end

  def create
    @product = Product.new(params_for_model)

    respond_to do |format|
      if @product.save
        format.html {
          if params[:mass_inserting] then
            redirect_to products_path(:mass_inserting => true)
          else
            redirect_to product_path(@product), :flash => { :notice => t(:create_success, :model => "product") }
          end
        }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html {
          if params[:mass_inserting] then
            redirect_to products_path(:mass_inserting => true), :flash => { :error => t(:error, "Error") }
          else
            render :action => "new"
          end
        }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @product.update_attributes(params_for_model)
        format.html { redirect_to product_path(@product), :flash => { :notice => t(:update_success, :model => "product") }}
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

  def batch
    attr_or_method, value = params[:actionprocess].split(".")

    @products = []    
    
    Product.transaction do
      if params[:checkallelt] == "all" then
        # Selected with filter and search
        do_sort_and_paginate(:product)

        @products = Product.ransack(
          params[:q]
        ).result(
          :distinct => true
        )
      else
        # Selected elements
        @products = Product.find(params[:ids].to_a)
      end

      @products.each{ |product|
        if not Product.columns_hash[attr_or_method].nil? and
               Product.columns_hash[attr_or_method].type == :boolean then
         product.update_attribute(attr_or_method, boolean(value))
         product.save
        else
          case attr_or_method
          # Set here your own batch processing
          # product.save
          when "destroy" then
            product.destroy
          end
        end
      }
    end
    
    redirect_to :back
  end

  def treeview

  end

  def treeview_update
    modelclass = Product
    foreignkey = :product_id

    render :nothing => true, :status => (update_treeview(modelclass, foreignkey) ? 200 : 500)
  end
  
  private 
  
  def load_product
    @product = Product.find(params[:id])
  end

  def params_for_model
    params.require(:product).permit(Product.permitted_attributes)
  end
end

