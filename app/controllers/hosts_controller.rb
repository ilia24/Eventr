class HostsController < ApplicationController
  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
  end

  def show
  end

  def destroy
  end
end
