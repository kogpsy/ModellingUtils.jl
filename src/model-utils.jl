abstract type ModelParam end

@kwdef mutable struct sim_param
  n_trial::Union{Int, Nothing} = nothing
  x::Union{Any, Nothing} = nothing
end

@kwdef mutable struct linreg_param <: ModelParam
  α::Union{Float64, Nothing} = nothing
  β::Union{Float64, Vector{Float64}, Nothing} = nothing
  σ::Union{Float64, Nothing} = nothing
end

function simulate_data(;model_param::linreg_param, simulation_param::sim_param)
  @unpack α, β, σ = model_param

  @assert !isnothing(α)
  @assert !isnothing(β)
  @assert !isnothing(σ)

  d = @chain DataFrame(x = repeat(simulation_param.x, inner = simulation_param.n_trial)) begin
    transform(:x => ByRow(x -> α .+ β * x) => :linpred)
    transform(:linpred => ByRow(li -> rand.(Normal.(li))) => :y)
  end
    #            y = rand.(Normal.(linpred, σ)))
  return d
end


@kwdef mutable struct logreg_param <: ModelParam
  α::Union{Float64, Nothing} = nothing
  β::Union{Float64, Vector{Float64}, Nothing} = nothing
end


function simulate_data(param::logreg_param)
  # simulate logreg
end

