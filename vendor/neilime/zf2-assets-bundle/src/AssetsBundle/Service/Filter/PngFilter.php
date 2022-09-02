<?php
namespace AssetsBundle\Service\Filter;
class PngFilter extends \AssetsBundle\Service\Filter\AbstractImageFilter{
	/**
	 * Compression level: from 0 (no compression) to 9.
	 * @var int
	 */
	protected $imageQuality = 9;

	/**
	 * Constructor
	 * @param int $iImageQuality
	 */
	public function __construct($iImageQuality = null){
		parent::__construct();
		$this->imageFunction = array($this,'optimize');
		if(isset($iImageQuality))$this->setImageQuality($iImageQuality);
	}

	/**
	 * @param int $iImageQuality
	 * @throws \InvalidArgumentException
	 * @return \AssetsBundle\Service\Filter\PngFilter
	 */
	public function setImageQuality($iImageQuality){
		if(!is_numeric($iImageQuality) || $iImageQuality < 0 || $iImageQuality > 9)throw new \InvalidArgumentException(sprintf(
			'$iImageQuality expects int from 0 to 9 "%s" given',
			is_scalar($iImageQuality)?$iImageQuality:(is_object($iImageQuality)?get_class($iImageQuality):gettype($iImageQuality))
		));
		$this->imageQuality = (int)$iImageQuality;
		return $this;
	}

	/**
	 * @return int
	 */
	public function getImageQuality(){
		return $this->imageQuality;
	}

	/**
	 * @param resource $oImage
	 * @param string $sImagePath
	 * @return boolean
	 */
	public function optimize($oImage,$sImagePath){
		return imagepng($oImage,$sImagePath,$this->getImageQuality());
	}
}