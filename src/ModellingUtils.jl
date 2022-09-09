module ModellingUtils

using Base: @kwdef
using Parameters
#using Random, Distributions
#using StatsFuns
using DataFrames
using Turing
using Gadfly
using TypedTables

# export Types
abstract type ModelParams end
abstract type ModelPrior end
export ModelParams, ModelPrior

include("turing-utils.jl")
export FittedModel, fit_model, Prior

include("simulation-utils.jl")
export plot_fit, param_recov_table


end # module
