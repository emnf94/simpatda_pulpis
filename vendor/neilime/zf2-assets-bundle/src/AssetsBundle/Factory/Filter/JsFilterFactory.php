<?php
namespace AssetsBundle\Factory\Filter;
class JsFilterFactory implements \Zend\ServiceManager\FactoryInterface{

	/**
	 * @param \Zend\ServiceManager\ServiceLocatorInterface $oServiceLocator
	 * @see \Zend\ServiceManager\FactoryInterface::createService()
	 * @return \AssetsBundle\Service\Filter\JsFilter
	 */
	public function createService(\Zend\ServiceManager\ServiceLocatorInterface $oServiceLocator){
		return new \AssetsBundle\Service\Filter\JsFilter();
	}
}