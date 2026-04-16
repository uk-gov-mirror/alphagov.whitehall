'use strict'
window.GOVUK = window.GOVUK || {}
window.GOVUK.Modules = window.GOVUK.Modules || {}
;(function (Modules) {
  class ImageProcessingChecker {
    static TIMEOUT_DURATION = 500
    static MAX_ATTEMPTS = 5

    constructor($root) {
      this.$root = $root
      this.imageLink = this.$root.dataset.imageLink

      this.timeoutDuration =
        this.$root.dataset.timeoutDuration ||
        ImageProcessingChecker.TIMEOUT_DURATION
      this.maxAttempts =
        this.$root.dataset.maxAttempts || ImageProcessingChecker.MAX_ATTEMPTS

      this.imagePreview = this.$root.querySelector('.js-image-preview')
      this.imagePreviewFailure = this.$root.querySelector(
        '.js-image-preview-failure'
      )
      this.imageStatus = this.$root.querySelector('.js-image-processing-status')

      // the image was not already loaded on page load
      if (this.imageStatus && !this.imageStatus.querySelector('img')) {
        this.checkImageStatus(this.maxAttempts)()
      }
    }

    checkImageStatus(attempts) {
      return () => {
        if (attempts > 0) {
          fetch(this.imageLink)
            .then((response) => response.json())
            // eslint-disable-next-line camelcase
            .then(({ image_data: { all_assets_uploaded, assets } }) => {
              // eslint-disable-next-line camelcase
              if (!all_assets_uploaded) {
                setTimeout(
                  this.checkImageStatus(attempts - 1),
                  this.timeoutDuration
                )
              } else {
                this.updateImageStatus(assets)
              }
            })
        } else {
          this.updateImageStatus()
        }
      }
    }

    updateImageStatus(assets) {
      this.imageStatus.innerHTML = ''

      let imagePreviewElement

      if (!assets) {
        // failed to acquire asset
        imagePreviewElement = document.importNode(
          this.imagePreviewFailure.content,
          true
        ).firstElementChild
      } else {
        imagePreviewElement = document.importNode(
          this.imagePreview.content,
          true
        ).firstElementChild

        const notOriginalAsset = assets.find(
          ({ variant }) => variant !== 'original'
        )

        // images with multiple assets can have
        // transformed variants so we should not use
        // the `original` asset if this is the case
        imagePreviewElement.src = notOriginalAsset
          ? notOriginalAsset.url
          : assets[0].url
      }

      this.imageStatus.appendChild(imagePreviewElement)
    }
  }

  Modules.ImageProcessingChecker = ImageProcessingChecker
})(window.GOVUK.Modules)
