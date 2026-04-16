describe('GOVUK.Modules.ImageProcessingChecker', function () {
  let imagePreview

  beforeEach(() => {
    const okResponse = new Response(
      JSON.stringify({
        image_data: {
          assets: [
            {
              variant: 'original',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed16af0b323dbb43e3b7/960x640.png'
            },
            {
              variant: 's712',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed166315c04d2043e3b7/s712_960x640.png'
            },
            {
              variant: 's300',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed186315c04d2043e3b8/s300_960x640.png'
            },
            {
              variant: 's630',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed18af0b323dbb43e3b8/s630_960x640.png'
            },
            {
              variant: 's960',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed18af0b323dbb43e3b9/s960_960x640.png'
            },
            {
              variant: 's465',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed186315c04d2043e3b9/s465_960x640.png'
            },
            {
              variant: 's216',
              url: 'http://asset-manager.dev.gov.uk/media/69d8ed18af0b323dbb43e3ba/s216_960x640.png'
            }
          ],
          all_assets_uploaded: true
        }
      }),
      { status: 200, statusText: 'OK' }
    )
    spyOn(window, 'fetch').and.resolveTo(okResponse)

    imagePreview = document.createElement('div')
    imagePreview.dataset.module = 'image-processing-checker'
    imagePreview.dataset.imageLink = 'https://placeholder.com/image/1'

    imagePreview.innerHTML = `
      <template class="js-image-preview">
        <img src="" />
      </template>
      <div class="js-image-processing-status">
        <span class="govuk-tag">
          PROCESSING
        </span>
      </div>
      <span class="js-image-preview-failure">
        FAILED
      </span>
    `
    document.body.appendChild(imagePreview)
  })

  it('should replace the processing status with the image preview', () => {
    // eslint-disable-next-line no-new
    new GOVUK.Modules.ImageProcessingChecker(imagePreview)

    expect(imagePreview.querySelector('img')).toBe(null)

    window.setTimeout(() => {
      expect(imagePreview.querySelector('img'))
    }, 600)
  })
})
