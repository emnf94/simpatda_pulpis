<?php
namespace AssetsBundle\View\Strategy;
abstract class AbstractStrategy implements \AssetsBundle\View\Strategy\StrategyInterface{
    /**
     * @var \Zend\View\Renderer\RendererInterface
     */
	protected $renderer;

	/**
	 * @var string
	 */
	protected $baseUrl;

    /**
     * @param \Zend\View\Renderer\RendererInterface $oRenderer
     * @return \AssetsBundle\View\Strategy\AbstractStrategy
     */
    public function setRenderer(\Zend\View\Renderer\RendererInterface $oRenderer){
        $this->renderer = $oRenderer;
        return $this;
    }

    /**
     * @return \Zend\View\Renderer\RendererInterface
     */
    public function getRenderer(){
        return $this->renderer;
    }

    /**
     * @param string $baseUrl
     * @return \AssetsBundle\View\Strategy\AbstractStrategy
     */
    public function setBaseUrl($sBaseUrl){
        $this->baseUrl = $sBaseUrl;
        return $this;
    }

    /**
     * @return string
     */
    public function getBaseUrl(){
        return $this->baseUrl;
    }
}