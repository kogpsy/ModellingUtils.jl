@kwdef mutable struct PriorPsychophysicsModel # mit types und defaults
  p_α
  p_β
end

@kwdef struct FittedModel
  fit::Chains
  model::DynamicPPL.Model
end

function fit_model(; model::Function, link_f::Function, prior::ModelPrior, d::DataFrame, alg=NUTS())
  m = model(d.x, d.y, prior = prior, f = link_f)
  fit = Turing.sample(m, alg, MCMCThreads(), 1000, 4)
  FittedModel(fit, m)
end

predict(fit::FittedModel) = predict(fit.model, fit.fit)

