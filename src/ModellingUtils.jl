module ModellingUtils

using Base: @kwdef
#using Parameters
#using Random, Distributions
#using StatsFuns
#using DataFrames
#using Turing
#using CairoMakie, AlgebraOfGraphics
#using TypedTables
#using TuringModels
using DataUtils
#export ModelParams

#abstract type ModelParams end

export Simulation 
@kwdef mutable struct Simulation
  model::Float64 = 5.0
  #param::ModelParams
end

#include("turing-utils.jl")
#export FittedModel, fit_model, Prior

#include("simulation-utils.jl")
#export plot_fit, param_recov_table
#
end # module
