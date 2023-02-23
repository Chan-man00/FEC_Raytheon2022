#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# SPDX-License-Identifier: GPL-3.0
#
# GNU Radio Python Flow Graph
# Title: Decoder
# Author: David Venegas
# GNU Radio version: 3.8.1.0

from distutils.version import StrictVersion

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print("Warning: failed to XInitThreads()")

from PyQt5 import Qt
from gnuradio import qtgui
from gnuradio.filter import firdes
import sip
from gnuradio import blocks
import numpy
from gnuradio import channels
from gnuradio import digital
from gnuradio import gr
import sys
import signal
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation
from gnuradio.qtgui import Range, RangeWidget
from gnuradio import qtgui

class Stage5_Decoder(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Decoder")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Decoder")
        qtgui.util.check_set_qss()
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
            pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "Stage5_Decoder")

        try:
            if StrictVersion(Qt.qVersion()) < StrictVersion("5.0.0"):
                self.restoreGeometry(self.settings.value("geometry").toByteArray())
            else:
                self.restoreGeometry(self.settings.value("geometry"))
        except:
            pass

        ##################################################
        # Variables
        ##################################################
        self.sps = sps = 4
        self.nfilts = nfilts = 32
        self.samp_rate = samp_rate = 32000
        self.root_raise_cosine = root_raise_cosine = firdes.root_raised_cosine(nfilts, nfilts, 1.0/float(sps), 0.35, 11*sps*nfilts)
        self.excess_bw = excess_bw = 0.35
        self.Timming_Loop_bw = Timming_Loop_bw = 0.0628
        self.Time_Offset = Time_Offset = 1
        self.QPSK = QPSK = digital.constellation_rect([-0.707-0.707j, -0.707+0.707j, 0.707+0.707j, 0.707-0.707j], [0, 1, 2, 3],
        4, 2, 2, 1, 1).base()
        self.Pahse_BW = Pahse_BW = 0.0628
        self.Freq_Offset = Freq_Offset = 0
        self.Eq_Gain = Eq_Gain = 0.01
        self.Delay = Delay = 50
        self.AWGN = AWGN = 0.0001

        ##################################################
        # Blocks
        ##################################################
        self._Eq_Gain_range = Range(0, 0.1, 0.001, 0.01, 200)
        self._Eq_Gain_win = RangeWidget(self._Eq_Gain_range, self.set_Eq_Gain, 'Eq: Rate', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Eq_Gain_win)
        self.recieved = Qt.QTabWidget()
        self.recieved_widget_0 = Qt.QWidget()
        self.recieved_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.recieved_widget_0)
        self.recieved_grid_layout_0 = Qt.QGridLayout()
        self.recieved_layout_0.addLayout(self.recieved_grid_layout_0)
        self.recieved.addTab(self.recieved_widget_0, 'Constellation')
        self.recieved_widget_1 = Qt.QWidget()
        self.recieved_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.recieved_widget_1)
        self.recieved_grid_layout_1 = Qt.QGridLayout()
        self.recieved_layout_1.addLayout(self.recieved_grid_layout_1)
        self.recieved.addTab(self.recieved_widget_1, 'Symbols')
        self.top_grid_layout.addWidget(self.recieved)
        self.qtgui_time_sink_x_0_0 = qtgui.time_sink_f(
            500, #size
            samp_rate, #samp_rate
            "", #name
            1 #number of inputs
        )
        self.qtgui_time_sink_x_0_0.set_update_time(0.10)
        self.qtgui_time_sink_x_0_0.set_y_axis(-1, 2)

        self.qtgui_time_sink_x_0_0.set_y_label('Amplitude', "")

        self.qtgui_time_sink_x_0_0.enable_tags(True)
        self.qtgui_time_sink_x_0_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, 0, "")
        self.qtgui_time_sink_x_0_0.enable_autoscale(False)
        self.qtgui_time_sink_x_0_0.enable_grid(False)
        self.qtgui_time_sink_x_0_0.enable_axis_labels(True)
        self.qtgui_time_sink_x_0_0.enable_control_panel(False)
        self.qtgui_time_sink_x_0_0.enable_stem_plot(False)


        labels = ['Signal 1', 'Signal 2', 'Signal 3', 'Signal 4', 'Signal 5',
            'Signal 6', 'Signal 7', 'Signal 8', 'Signal 9', 'Signal 10']
        widths = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        colors = ['blue', 'red', 'green', 'black', 'cyan',
            'magenta', 'yellow', 'dark red', 'dark green', 'dark blue']
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
            1.0, 1.0, 1.0, 1.0, 1.0]
        styles = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        markers = [-1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1]


        for i in range(1):
            if len(labels[i]) == 0:
                self.qtgui_time_sink_x_0_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_time_sink_x_0_0.set_line_label(i, labels[i])
            self.qtgui_time_sink_x_0_0.set_line_width(i, widths[i])
            self.qtgui_time_sink_x_0_0.set_line_color(i, colors[i])
            self.qtgui_time_sink_x_0_0.set_line_style(i, styles[i])
            self.qtgui_time_sink_x_0_0.set_line_marker(i, markers[i])
            self.qtgui_time_sink_x_0_0.set_line_alpha(i, alphas[i])

        self._qtgui_time_sink_x_0_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0_0.pyqwidget(), Qt.QWidget)
        self.top_grid_layout.addWidget(self._qtgui_time_sink_x_0_0_win)
        self.qtgui_time_sink_x_0 = qtgui.time_sink_f(
            128, #size
            samp_rate, #samp_rate
            "", #name
            2 #number of inputs
        )
        self.qtgui_time_sink_x_0.set_update_time(0.10)
        self.qtgui_time_sink_x_0.set_y_axis(-1, 2)

        self.qtgui_time_sink_x_0.set_y_label('Amplitude', "")

        self.qtgui_time_sink_x_0.enable_tags(True)
        self.qtgui_time_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, 0, "")
        self.qtgui_time_sink_x_0.enable_autoscale(False)
        self.qtgui_time_sink_x_0.enable_grid(False)
        self.qtgui_time_sink_x_0.enable_axis_labels(True)
        self.qtgui_time_sink_x_0.enable_control_panel(False)
        self.qtgui_time_sink_x_0.enable_stem_plot(False)


        labels = ['Rx Bits', 'Tx Bits', 'Signal 3', 'Signal 4', 'Signal 5',
            'Signal 6', 'Signal 7', 'Signal 8', 'Signal 9', 'Signal 10']
        widths = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        colors = ['blue', 'red', 'green', 'black', 'cyan',
            'magenta', 'yellow', 'dark red', 'dark green', 'dark blue']
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
            1.0, 1.0, 1.0, 1.0, 1.0]
        styles = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        markers = [-1, -1, -1, -1, -1,
            -1, -1, -1, -1, -1]


        for i in range(2):
            if len(labels[i]) == 0:
                self.qtgui_time_sink_x_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_time_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_time_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_time_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_time_sink_x_0.set_line_style(i, styles[i])
            self.qtgui_time_sink_x_0.set_line_marker(i, markers[i])
            self.qtgui_time_sink_x_0.set_line_alpha(i, alphas[i])

        self._qtgui_time_sink_x_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_grid_layout.addWidget(self._qtgui_time_sink_x_0_win)
        self.qtgui_const_sink_x_1 = qtgui.const_sink_c(
            1024, #size
            "Rx Equalized", #name
            1 #number of inputs
        )
        self.qtgui_const_sink_x_1.set_update_time(0.10)
        self.qtgui_const_sink_x_1.set_y_axis(-2, 2)
        self.qtgui_const_sink_x_1.set_x_axis(-2, 2)
        self.qtgui_const_sink_x_1.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, "")
        self.qtgui_const_sink_x_1.enable_autoscale(False)
        self.qtgui_const_sink_x_1.enable_grid(False)
        self.qtgui_const_sink_x_1.enable_axis_labels(True)


        labels = ['', '', '', '', '',
            '', '', '', '', '']
        widths = [1, 1, 1, 1, 1,
            1, 1, 1, 1, 1]
        colors = ["blue", "red", "red", "red", "red",
            "red", "red", "red", "red", "red"]
        styles = [0, 0, 0, 0, 0,
            0, 0, 0, 0, 0]
        markers = [0, 0, 0, 0, 0,
            0, 0, 0, 0, 0]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
            1.0, 1.0, 1.0, 1.0, 1.0]

        for i in range(1):
            if len(labels[i]) == 0:
                self.qtgui_const_sink_x_1.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_const_sink_x_1.set_line_label(i, labels[i])
            self.qtgui_const_sink_x_1.set_line_width(i, widths[i])
            self.qtgui_const_sink_x_1.set_line_color(i, colors[i])
            self.qtgui_const_sink_x_1.set_line_style(i, styles[i])
            self.qtgui_const_sink_x_1.set_line_marker(i, markers[i])
            self.qtgui_const_sink_x_1.set_line_alpha(i, alphas[i])

        self._qtgui_const_sink_x_1_win = sip.wrapinstance(self.qtgui_const_sink_x_1.pyqwidget(), Qt.QWidget)
        self.top_grid_layout.addWidget(self._qtgui_const_sink_x_1_win)
        self.digital_pfb_clock_sync_xxx_0 = digital.pfb_clock_sync_ccf(4.004, 0.0628, root_raise_cosine, 32, 16, 1.5, 2)
        self.digital_map_bb_0 = digital.map_bb([0,1,2,3])
        self.digital_diff_decoder_bb_0 = digital.diff_decoder_bb(4)
        self.digital_costas_loop_cc_0 = digital.costas_loop_cc(0.0628, 4, False)
        self.digital_constellation_modulator_0 = digital.generic_mod(
            constellation=QPSK,
            differential=True,
            samples_per_symbol=4,
            pre_diff_code=True,
            excess_bw=0.35,
            verbose=False,
            log=False)
        self.digital_constellation_decoder_cb_0 = digital.constellation_decoder_cb(QPSK)
        self.digital_cma_equalizer_cc_0 = digital.cma_equalizer_cc(15, 4, Eq_Gain, 2)
        self.channels_channel_model_0 = channels.channel_model(
            noise_voltage=0.0001,
            frequency_offset=0,
            epsilon=1,
            taps=[1],
            noise_seed=0,
            block_tags=False)
        self.blocks_unpack_k_bits_bb_1 = blocks.unpack_k_bits_bb(8)
        self.blocks_unpack_k_bits_bb_0 = blocks.unpack_k_bits_bb(2)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)
        self.blocks_delay_0 = blocks.delay(gr.sizeof_float*1, 50)
        self.blocks_char_to_float_0_0_0 = blocks.char_to_float(1, 1)
        self.blocks_char_to_float_0_0 = blocks.char_to_float(1, 1)
        self.blocks_char_to_float_0 = blocks.char_to_float(1, 1)
        self.analog_random_source_x_0 = blocks.vector_source_b(list(map(int, numpy.random.randint(0, 255, 10000))), True)
        self._Timming_Loop_bw_range = Range(0, 0.2, 0.01, 0.0628, 200)
        self._Timming_Loop_bw_win = RangeWidget(self._Timming_Loop_bw_range, self.set_Timming_Loop_bw, 'Time: BW', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Timming_Loop_bw_win)
        self._Time_Offset_range = Range(0.999, 1.001, 0.0001, 1, 200)
        self._Time_Offset_win = RangeWidget(self._Time_Offset_range, self.set_Time_Offset, 'Channel: Timing Offset', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Time_Offset_win)
        self._Pahse_BW_range = Range(0, 1, 0.01, 0.0628, 200)
        self._Pahse_BW_win = RangeWidget(self._Pahse_BW_range, self.set_Pahse_BW, 'Phase: BW', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Pahse_BW_win)
        self._Freq_Offset_range = Range(-0.1, 0.1, 0.001, 0, 200)
        self._Freq_Offset_win = RangeWidget(self._Freq_Offset_range, self.set_Freq_Offset, 'Channel: Frequency Offset', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Freq_Offset_win)
        self._Delay_range = Range(0, 200, 1, 50, 200)
        self._Delay_win = RangeWidget(self._Delay_range, self.set_Delay, 'Delay', "counter_slider", float)
        self.top_grid_layout.addWidget(self._Delay_win)
        self.Controls = Qt.QTabWidget()
        self.Controls_widget_0 = Qt.QWidget()
        self.Controls_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.Controls_widget_0)
        self.Controls_grid_layout_0 = Qt.QGridLayout()
        self.Controls_layout_0.addLayout(self.Controls_grid_layout_0)
        self.Controls.addTab(self.Controls_widget_0, 'Channel')
        self.Controls_widget_1 = Qt.QWidget()
        self.Controls_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.Controls_widget_1)
        self.Controls_grid_layout_1 = Qt.QGridLayout()
        self.Controls_layout_1.addLayout(self.Controls_grid_layout_1)
        self.Controls.addTab(self.Controls_widget_1, 'Receiver')
        self.top_grid_layout.addWidget(self.Controls)
        self._AWGN_range = Range(0, 1, 0.01, 0.0001, 200)
        self._AWGN_win = RangeWidget(self._AWGN_range, self.set_AWGN, 'Channel: Noise Voltage', "counter_slider", float)
        self.top_grid_layout.addWidget(self._AWGN_win)



        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_random_source_x_0, 0), (self.blocks_unpack_k_bits_bb_1, 0))
        self.connect((self.analog_random_source_x_0, 0), (self.digital_constellation_modulator_0, 0))
        self.connect((self.blocks_char_to_float_0, 0), (self.qtgui_time_sink_x_0, 0))
        self.connect((self.blocks_char_to_float_0_0, 0), (self.qtgui_time_sink_x_0_0, 0))
        self.connect((self.blocks_char_to_float_0_0_0, 0), (self.blocks_delay_0, 0))
        self.connect((self.blocks_delay_0, 0), (self.qtgui_time_sink_x_0, 1))
        self.connect((self.blocks_throttle_0, 0), (self.channels_channel_model_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_0, 0), (self.blocks_char_to_float_0, 0))
        self.connect((self.blocks_unpack_k_bits_bb_1, 0), (self.blocks_char_to_float_0_0_0, 0))
        self.connect((self.channels_channel_model_0, 0), (self.digital_pfb_clock_sync_xxx_0, 0))
        self.connect((self.digital_cma_equalizer_cc_0, 0), (self.digital_costas_loop_cc_0, 0))
        self.connect((self.digital_constellation_decoder_cb_0, 0), (self.blocks_char_to_float_0_0, 0))
        self.connect((self.digital_constellation_decoder_cb_0, 0), (self.digital_diff_decoder_bb_0, 0))
        self.connect((self.digital_constellation_modulator_0, 0), (self.blocks_throttle_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.digital_constellation_decoder_cb_0, 0))
        self.connect((self.digital_costas_loop_cc_0, 0), (self.qtgui_const_sink_x_1, 0))
        self.connect((self.digital_diff_decoder_bb_0, 0), (self.digital_map_bb_0, 0))
        self.connect((self.digital_map_bb_0, 0), (self.blocks_unpack_k_bits_bb_0, 0))
        self.connect((self.digital_pfb_clock_sync_xxx_0, 0), (self.digital_cma_equalizer_cc_0, 0))

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "Stage5_Decoder")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_sps(self):
        return self.sps

    def set_sps(self, sps):
        self.sps = sps
        self.set_root_raise_cosine(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

    def get_nfilts(self):
        return self.nfilts

    def set_nfilts(self, nfilts):
        self.nfilts = nfilts
        self.set_root_raise_cosine(firdes.root_raised_cosine(self.nfilts, self.nfilts, 1.0/float(self.sps), 0.35, 11*self.sps*self.nfilts))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
        self.qtgui_time_sink_x_0.set_samp_rate(self.samp_rate)
        self.qtgui_time_sink_x_0_0.set_samp_rate(self.samp_rate)

    def get_root_raise_cosine(self):
        return self.root_raise_cosine

    def set_root_raise_cosine(self, root_raise_cosine):
        self.root_raise_cosine = root_raise_cosine
        self.digital_pfb_clock_sync_xxx_0.update_taps(self.root_raise_cosine)

    def get_excess_bw(self):
        return self.excess_bw

    def set_excess_bw(self, excess_bw):
        self.excess_bw = excess_bw

    def get_Timming_Loop_bw(self):
        return self.Timming_Loop_bw

    def set_Timming_Loop_bw(self, Timming_Loop_bw):
        self.Timming_Loop_bw = Timming_Loop_bw

    def get_Time_Offset(self):
        return self.Time_Offset

    def set_Time_Offset(self, Time_Offset):
        self.Time_Offset = Time_Offset

    def get_QPSK(self):
        return self.QPSK

    def set_QPSK(self, QPSK):
        self.QPSK = QPSK

    def get_Pahse_BW(self):
        return self.Pahse_BW

    def set_Pahse_BW(self, Pahse_BW):
        self.Pahse_BW = Pahse_BW

    def get_Freq_Offset(self):
        return self.Freq_Offset

    def set_Freq_Offset(self, Freq_Offset):
        self.Freq_Offset = Freq_Offset

    def get_Eq_Gain(self):
        return self.Eq_Gain

    def set_Eq_Gain(self, Eq_Gain):
        self.Eq_Gain = Eq_Gain
        self.digital_cma_equalizer_cc_0.set_gain(self.Eq_Gain)

    def get_Delay(self):
        return self.Delay

    def set_Delay(self, Delay):
        self.Delay = Delay

    def get_AWGN(self):
        return self.AWGN

    def set_AWGN(self, AWGN):
        self.AWGN = AWGN



def main(top_block_cls=Stage5_Decoder, options=None):

    if StrictVersion("4.5.0") <= StrictVersion(Qt.qVersion()) < StrictVersion("5.0.0"):
        style = gr.prefs().get_string('qtgui', 'style', 'raster')
        Qt.QApplication.setGraphicsSystem(style)
    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()
    tb.start()
    tb.show()

    def sig_handler(sig=None, frame=None):
        Qt.QApplication.quit()

    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    timer = Qt.QTimer()
    timer.start(500)
    timer.timeout.connect(lambda: None)

    def quitting():
        tb.stop()
        tb.wait()
    qapp.aboutToQuit.connect(quitting)
    qapp.exec_()


if __name__ == '__main__':
    main()
