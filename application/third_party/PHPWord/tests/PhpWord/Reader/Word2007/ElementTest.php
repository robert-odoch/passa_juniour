<?php
/**
 * This file is part of PHPWord - A pure PHP library for reading and writing
 * word processing documents.
 *
 * PHPWord is free software distributed under the terms of the GNU Lesser
 * General Public License version 3 as published by the Free Software Foundation.
 *
 * For the full copyright and license information, please read the LICENSE
 * file that was distributed with this source code. For the full list of
 * contributors, visit https://github.com/PHPOffice/PHPWord/contributors.
 *
 * @see         https://github.com/PHPOffice/PHPWord
 * @copyright   2010-2018 PHPWord contributors
 * @license     http://www.gnu.org/licenses/lgpl.txt LGPL version 3
 */

namespace PhpOffice\PhpWord\Reader\Word2007;

use PhpOffice\PhpWord\AbstractTestReader;

/**
 * Test class for PhpOffice\PhpWord\Reader\Word2007\Element subnamespace
 */
class ElementTest extends AbstractTestReader
{
    /**
     * Test reading of textbreak
     */
    public function testReadTextBreak()
    {
        $documentXml = '<w:p>
            <w:r>
                <w:br/>
                <w:t xml:space="preserve">test string</w:t>
            </w:r>
        </w:p>';

        $phpWord = $this->getDocumentFromString(array('document' => $documentXml));

        $elements = $phpWord->getSection(0)->getElements();
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\TextBreak', $elements[0]);
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\Text', $elements[1]);
        $this->assertEquals('test string', $elements[1]->getText());
    }

    /**
     * Test reading of textbreak
     */
    public function testReadListItemRunWithFormatting()
    {
        $documentXml = '<w:p>
            <w:pPr>
                <w:numPr>
                    <w:ilvl w:val="0"/>
                    <w:numId w:val="11"/>
                </w:numPr>
            </w:pPr>
            <w:r>
                <w:t>Two</w:t>
            </w:r>
            <w:r>
                <w:t xml:space="preserve"> with </w:t>
            </w:r>
            <w:r>
                <w:rPr>
                    <w:b/>
                </w:rPr>
                <w:t>bold</w:t>
            </w:r>
        </w:p>';

        $phpWord = $this->getDocumentFromString(array('document' => $documentXml));

        $sections = $phpWord->getSection(0);
        $this->assertNull($sections->getElement(999));
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\ListItemRun', $sections->getElement(0));
        $this->assertEquals(0, $sections->getElement(0)->getDepth());

        $listElements = $sections->getElement(0)->getElements();
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\Text', $listElements[0]);
        $this->assertEquals('Two', $listElements[0]->getText());
        $this->assertEquals(' with ', $listElements[1]->getText());
        $this->assertEquals('bold', $listElements[2]->getText());
        $this->assertTrue($listElements[2]->getFontStyle()->getBold());
    }

    /**
     * Test reading Title style
     */
    public function testReadTitleStyle()
    {
        $documentXml = '<w:p>
            <w:pPr>
                <w:pStyle w:val="Title"/>
            </w:pPr>
            <w:r>
                <w:t>This is a non formatted title</w:t>
            </w:r>
        </w:p>
        <w:p>
            <w:pPr>
                <w:pStyle w:val="Title"/>
            </w:pPr>
            <w:r>
                <w:t>This is a </w:t>
            </w:r>
            <w:r>
                <w:rPr>
                    <w:b/>
                </w:rPr>
                <w:t>bold</w:t>
            </w:r>
            <w:r>
                <w:t> title</w:t>
            </w:r>
        </w:p>';

        $stylesXml = '<w:style w:type="paragraph" w:styleId="Title">
            <w:name w:val="Title"/>
            <w:link w:val="TitleChar"/>
            <w:rPr>
                <w:i/>
            </w:rPr>
        </w:style>';

        $phpWord = $this->getDocumentFromString(array('document' => $documentXml, 'styles' => $stylesXml));

        $elements = $phpWord->getSection(0)->getElements();
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\Title', $elements[0]);
        /** @var \PhpOffice\PhpWord\Element\Title $title */
        $title = $elements[0];
        $this->assertEquals('Title', $title->getStyle());
        $this->assertEquals('This is a non formatted title', $title->getText());

        $this->assertInstanceOf('PhpOffice\PhpWord\Element\Title', $elements[1]);
        /** @var \PhpOffice\PhpWord\Element\Title $formattedTitle */
        $formattedTitle = $elements[1];
        $this->assertEquals('Title', $formattedTitle->getStyle());
        $this->assertInstanceOf('PhpOffice\PhpWord\Element\TextRun', $formattedTitle->getText());
    }
}
