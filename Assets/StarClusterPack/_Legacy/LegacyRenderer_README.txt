Materials for Legacy renderer was configured with gamma colorspace

To see the correct result you should:
1) Remove any render pipeline assets from "ProjectSettings/Graphics/ScriptableRenderPipelineAsset"
2) Switch to Gamma Space

if you using LegacyRenderer and linear color space then enable LinearWorkflow toggle in all starcluster materials for Legacy renderer