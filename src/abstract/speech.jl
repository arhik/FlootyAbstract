# ═══════════════════════════════════════════════════════════════════════
# Abstract Speech Interface
# Common API for text-to-speech across all providers
# ═══════════════════════════════════════════════════════════════════════

"""
    AbstractSpeechResponse <: AbstractProviderObject

Result of a text-to-speech request. Providers implement the accessors.
"""
abstract type AbstractSpeechResponse <: AbstractProviderObject end

"""Raw audio bytes (Vector{UInt8})."""
speech_audio(r::AbstractSpeechResponse) = error("speech_audio not implemented for $(typeof(r))")

"""Container format symbol, e.g. :wav or :pcm."""
speech_format(r::AbstractSpeechResponse) = error("speech_format not implemented for $(typeof(r))")

"""MIME type string, e.g. "audio/wav"."""
speech_mime(r::AbstractSpeechResponse) = error("speech_mime not implemented for $(typeof(r))")

"""Model that produced the audio."""
speech_model(r::AbstractSpeechResponse) = error("speech_model not implemented for $(typeof(r))")

"""
    AbstractSpeechProvider

A provider that can synthesize speech (text-to-speech).
"""
abstract type AbstractSpeechProvider end

"""
    speech(provider, text; model, voice, format, kwargs...) -> AbstractSpeechResponse

Synthesize `text` into audio. Providers implement this.
"""
function speech(provider::AbstractSpeechProvider, text::String; kwargs...)
    throw(MethodError(speech, (provider, text)))
end

"""
    speech_voices(provider, model) -> Vector{String}

List the voices a model supports. Providers may return an empty vector
when the backend does not enumerate them.
"""
function speech_voices(provider::AbstractSpeechProvider, model::String)
    return String[]
end

"""
    supports_speech(provider, model) -> Bool

Whether `model` can synthesize speech.
"""
function supports_speech(provider::AbstractSpeechProvider, model::String)
    return false
end
