abstract type ModelParam end

@kwdef mutable struct linreg_param <: ModelParam
  α::Float64
  β_1::Float64
  β_2::Float64
  β_3::Float64
  σ::Float64  
end

@kwdef mutable struct logreg_param <: ModelParam
  α::Float64
  β_1::Float64
  β_2::Float64
end


@kwdef mutable struct simulation
  #nb_vpn::Union{Int, Nothing} = nothing
  #nb_trials::Union{Int, Nothing} = nothing
  sim_param::Union{ModelParam, Nothing} = nothing
  predictors::Union{DataFrame, Nothing} = nothing 
  y_sim::Union{DataFrame, Nothing} = nothing
end

#  model::DynamicPPL.Model
#  param::ModelParams
#  data::DataFrame
#  fit::Chains
#end

#function plot_fit(fit::FittedModel, data)
#  # model parameters
#  Α = fit.fit[:α]
#  Β = fit.fit[:β]
#  Λ = fit.fit[:λ]
#  Γ = fit.fit[:γ]
#  α = mean(Α)
#  β = mean(Β)
#  λ = mean(Λ)
#  γ = mean(Γ)
#  # fit data
#  d_plot = DataFrame(x = minimum(data.x):0.01:maximum(data.x))
#  d_plot.linpred = α .+ β .* d_plot.x
#  d_plot.y = γ .+ (1-γ-λ) .* logistic.(d_plot.linpred)
#  d_plot.ymin = d_plot.y .- 0.1
#  d_plot.ymax = d_plot.y .+ 0.1
#  # explorative data
#  d_exp = combine(groupby(data, :x), :y=>mean=>:y)
#  # plot
#  Gadfly.plot(
#              layer(d_exp,
#                    x = :x,
#                    y = :y,
#                    Geom.point),
#              layer(d_plot,
#                    x = :x,
#                    y = :y,
#                    ymin = :ymin,
#                    ymax = :ymax,
#                    Geom.line,
#                    Geom.ribbon)
#             )
#end

#function param_recov_table(fit::FittedModel, params::ModelParams)
#  @unpack b₀, bₓ, λ, γ, f = params
#
#  Table(param = ["b₀", "bₓ", "λ", "γ"],
#        sim = [b₀, bₓ, λ, γ],
#        fit = [mean(fit.fit[:α]), mean(fit.fit[:β]), mean(fit.fit[:λ]), mean(fit.fit[:γ])])
#end

